

<details><summary>enable workload identiy of aks</summary>

```diff
az aks update \
    --name ${CLUSTER} \
    --enable-oidc-issuer \
    --enable-workload-identity # ?? This option is currently only available when using the aks-preview extension.
```
</details>







<details><summary>create identity</summary>

```diff
export IDENTITY_NAME=cert-manager

az identity create --resource-group sgune-rg --name "${IDENTITY_NAME}"




{
  "clientId": "503359ab-e4b6-4327-a4b9-e2f717dab297",
  "id": "/subscriptions/0f8ed921-d9a8-41b0-aeca-1b4dbab56daa/resourcegroups/sgune-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/cert-manager",
  "location": "eastus",
  "name": "cert-manager",
  "principalId": "64e82138-1249-476c-ab88-cd9a67133d06",
  "resourceGroup": "sgune-rg",
  "systemData": null,
  "tags": {},
  "tenantId": "e53d85a4-e3d4-4de2-9adb-294f70602bcc",
  "type": "Microsoft.ManagedIdentity/userAssignedIdentities"
}
```
</details>



<details><summary>Assign role</summary>

```diff
export IDENTITY_CLIENT_ID=$(az identity show --name "${IDENTITY_NAME}" --resource-group sgune-rg --query 'clientId' -o tsv)
 az role assignment create \                                                            10s az Azure subscription 1 09:55:03 PM
    --role "DNS Zone Contributor" \
    --assignee $IDENTITY_CLIENT_ID \
    --scope $(az network dns zone show --name boopablesnoot.click --resource-group sgune-rg -o tsv --query id)
{
  "condition": null,
  "conditionVersion": null,
  "createdBy": null,
  "createdOn": "2023-12-16T16:25:39.204030+00:00",
  "delegatedManagedIdentityResourceId": null,
  "description": null,
  "id": "/subscriptions/0f8ed921-d9a8-41b0-aeca-1b4dbab56daa/resourceGroups/sgune-rg/providers/Microsoft.Network/dnszones/boopablesnoot.click/providers/Microsoft.Authorization/roleAssignments/ecc2a1bd-f5a3-43a9-a546-31129186e030",
  "name": "ecc2a1bd-f5a3-43a9-a546-31129186e030",
  "principalId": "64e82138-1249-476c-ab88-cd9a67133d06",
  "principalType": "ServicePrincipal",
  "resourceGroup": "sgune-rg",
  "roleDefinitionId": "/subscriptions/0f8ed921-d9a8-41b0-aeca-1b4dbab56daa/providers/Microsoft.Authorization/roleDefinitions/befefa01-2a29-4197-83a8-272ff33ce314",
  "scope": "/subscriptions/0f8ed921-d9a8-41b0-aeca-1b4dbab56daa/resourceGroups/sgune-rg/providers/Microsoft.Network/dnszones/boopablesnoot.click",
  "type": "Microsoft.Authorization/roleAssignments",
  "updatedBy": "d10f2f46-5284-4c3e-b7f0-c8075ba2e8c9",
  "updatedOn": "2023-12-16T16:25:40.908596+00:00"
}
```
</details>



<details><summary>Federated Identity</summary>

```diff
 export SERVICE_ACCOUNT_NAME=cert-manager # ?<fe0f> This is the default Kubernetes ServiceAccount used by the cert-manager controller.
export SERVICE_ACCOUNT_NAMESPACE=cert-manager # ?<fe0f> This is the default namespace for cert-manager.
export SERVICE_ACCOUNT_ISSUER=$(az aks show --resource-group sgune-rg --name sgune-aks-cluster --query "oidcIssuerProfile.issuerUrl" -o tsv)
az identity federated-credential create \
  --resource-group sgune-rg \
  --name "cert-manager" \
  --identity-name "${IDENTITY_NAME}" \
  --issuer "${SERVICE_ACCOUNT_ISSUER}" \
  --subject "system:serviceaccount:${SERVICE_ACCOUNT_NAMESPACE}:${SERVICE_ACCOUNT_NAME}"
{
  "audiences": [
    "api://AzureADTokenExchange"
  ],
  "id": "/subscriptions/0f8ed921-d9a8-41b0-aeca-1b4dbab56daa/resourcegroups/sgune-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/cert-manager/federatedIdentityCredentials/cert-manager",
  "issuer": "https://eastus.oic.prod-aks.azure.com/e53d85a4-e3d4-4de2-9adb-294f70602bcc/0a308626-b74b-435f-bfc4-c4d3deb2dbce/",
  "name": "cert-manager",
  "resourceGroup": "sgune-rg",
  "subject": "system:serviceaccount:cert-manager:cert-manager",
  "systemData": null,
  "type": "Microsoft.ManagedIdentity/userAssignedIdentities/federatedIdentityCredentials"
}
```
</details>


<details><summary>Record Creation</summary>

```diff
 az network dns record-set cname set-record \
    --resource-group sgune-rg \
    --zone-name sgune.com \
    --cname gmanginx.sgune.com \
    --record-set-name gmannginx

{
  "CNAMERecord": {
    "cname": "gmanginx.sgune.com"
  },
  "TTL": 3600,
  "etag": "42aef31a-3707-42b1-a46b-2628e0c85fa7",
  "fqdn": "gmannginx.sgune.com.",
  "id": "/subscriptions/0f8ed921-d9a8-41b0-aeca-1b4dbab56daa/resourceGroups/sgune-rg/providers/Microsoft.Network/dnszones/sgune.com/CNAME/gmannginx",
  "name": "gmannginx",
  "provisioningState": "Succeeded",
  "resourceGroup": "sgune-rg",
  "targetResource": {},
  "type": "Microsoft.Network/dnszones/CNAME"
}
```
</details>


<details><summary>CERT CREATION SUCCESS</summary>

```diff
cmctl status certificate nginx-tls                                          4s kube sgune-aks-cluster/cert-manager 09:58:51 PM
Name: nginx-tls
Namespace: cert-manager
Created at: 2023-12-16T21:58:50+05:30
Conditions:
  Ready: True, Reason: Ready, Message: Certificate is up to date and has not expired
DNS Names:
- nginx.boopablesnoot.click
Events:  <none>
Issuer:
  Name: letsencrypt-azure-dns
  Kind: ClusterIssuer
  Conditions:
    Ready: True, Reason: ACMEAccountRegistered, Message: The ACME account was registered with the ACME server
  Events:  <none>
Secret:
  Name: nginx-tls
  Issuer Country: US
  Issuer Organisation: Let's Encrypt
  Issuer Common Name: R3
  Key Usage: Digital Signature, Key Encipherment
  Extended Key Usages: Server Authentication, Client Authentication
  Public Key Algorithm: RSA
  Signature Algorithm: SHA256-RSA
  Subject Key ID: e40f802761bf08f37f95c4f334093f0b4a3526d7
  Authority Key ID: 142eb317b75856cbae500940e61faf9d8b14c2c6
  Serial Number: 03de59416b2e5a05655858920160cca40543
  Events:  <none>
Not Before: 2023-12-16T20:57:57+05:30
Not After: 2024-03-15T20:57:56+05:30
Renewal Time: 2024-02-14T20:57:56+05:30
```
</details>

<details><summary>Hello App Cert Check based on helloweb.boopablesnoot.click</summary>

```diff
~ > curl -v https://helloweb.boopablesnoot.click                                                                                                               12:52:32 PM
*   Trying 20.232.87.5:443...
* Connected to helloweb.boopablesnoot.click (20.232.87.5) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
*  CAfile: /etc/ssl/certs/ca-certificates.crt
*  CApath: /etc/ssl/certs
* TLSv1.0 (OUT), TLS header, Certificate Status (22):
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.2 (IN), TLS header, Certificate Status (22):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS header, Finished (20):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.2 (OUT), TLS header, Finished (20):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_128_GCM_SHA256
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=helloweb.boopablesnoot.click
*  start date: Dec 17 06:05:22 2023 GMT
*  expire date: Mar 16 06:05:21 2024 GMT
*  subjectAltName: host "helloweb.boopablesnoot.click" matched cert's "helloweb.boopablesnoot.click"
*  issuer: C=US; O=Let's Encrypt; CN=R3
*  SSL certificate verify ok.
* Using HTTP2, server supports multiplexing
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* Using Stream ID: 1 (easy handle 0x558a2b127e90)
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
> GET / HTTP/2
> Host: helloweb.boopablesnoot.click
> user-agent: curl/7.81.0
> accept: */*
>
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* Connection state changed (MAX_CONCURRENT_STREAMS == 250)!
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
< HTTP/2 200
< content-type: text/plain; charset=utf-8
< content-length: 70
< date: Sun, 17 Dec 2023 07:23:37 GMT
<
Hello, world!
Protocol: HTTP/2.0!
Hostname: helloweb-856f9bc6fd-mv6kp
* Connection #0 to host helloweb.boopablesnoot.click left intact
```
</details>
