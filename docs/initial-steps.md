## Necessary installations
- azure cli using `curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash`
- homebrew
- tfenv
- [tgenv](https://github.com/cunymatthieu/tgenv) 
- terraform or [opentofu](https://opentofu.org/docs/intro/install/deb)
- check the modules available for providers at https://github.com/opentofu/registry/tree/main/modules
- tgenv install [version](https://github.com/gruntwork-io/terragrunt/releases) and then do `tgenv use 0.54.0`
- `TERRAGRUNT_TFPATH=tofu`
- resource provider registrations
  - Microsoft.ContainerService
  - Microsoft.Storage

<details><summary>AZURE REGIONS</summary>

```diff
 List of available regions is 'eastasia,southeastasia,australiaeast,australiasoutheast,brazilsouth,canadacentral,canadaeast,switzerlandnorth,germanywestcentral,eastus2,eastus,centralus,northcentralus,francecentral,uksouth,ukwest,centralindia,southindia,jioindiawest,italynorth,japaneast,japanwest,koreacentral,koreasouth,northeurope,norwayeast,polandcentral,qatarcentral,swedencentral,uaenorth,westcentralus,westeurope,westus2,westus,southcentralus,westus3,southafricanorth,australiacentral,australiacentral2,israelcentral,westindia'
```
</details>


### Running Gruntplan with tofu
<details><summary>output</summary>

```diff
[INFO] Getting version from tgenv-version-name
[INFO] TGENV_VERSION is 0.54.0
DEBU[0000] Terragrunt Version: 0.54.0                   
DEBU[0000] Did not find any locals block: skipping evaluation. 
DEBU[0000] Running command: tofu --version               prefix=[/home/sgune/codebase/aks/tg-root] 
DEBU[0000] tofu version: 1.6.0                          
DEBU[0000] Reading Terragrunt config file at /home/sgune/codebase/aks/tg-root/terragrunt.hcl 
DEBU[0000] Did not find any locals block: skipping evaluation. 
DEBU[0000] Did not find any locals block: skipping evaluation. 
DEBU[0000] Downloading Terraform configurations from https://registry.terraform.io/providers/hashicorp/azurerm/3.84.0 into /home/sgune/codebase/aks/tg-root/.terragrunt-cache/wuWRzEi11mfqxNuxKvMluL2AyNI/8VaC0JuVkfBOg5RLURXh2MMVL38 
DEBU[0003] Copying files from /home/sgune/codebase/aks/tg-root into /home/sgune/codebase/aks/tg-root/.terragrunt-cache/wuWRzEi11mfqxNuxKvMluL2AyNI/8VaC0JuVkfBOg5RLURXh2MMVL38 
DEBU[0003] Setting working directory to /home/sgune/codebase/aks/tg-root/.terragrunt-cache/wuWRzEi11mfqxNuxKvMluL2AyNI/8VaC0JuVkfBOg5RLURXh2MMVL38 
DEBU[0003] Generated file /home/sgune/codebase/aks/tg-root/.terragrunt-cache/wuWRzEi11mfqxNuxKvMluL2AyNI/8VaC0JuVkfBOg5RLURXh2MMVL38/provider.tf.  prefix=[/home/sgune/codebase/aks/tg-root] 
INFO[0003] Debug mode requested: generating debug file terragrunt-debug.tfvars.json in working dir /home/sgune/codebase/aks/tg-root/.terragrunt-cache/wuWRzEi11mfqxNuxKvMluL2AyNI/8VaC0JuVkfBOg5RLURXh2MMVL38  prefix=[/home/sgune/codebase/aks/tg-root] 
DEBU[0003] The following variables were detected in the terraform module:  prefix=[/home/sgune/codebase/aks/tg-root] 
DEBU[0003] []                                            prefix=[/home/sgune/codebase/aks/tg-root] 
DEBU[0003] Variables passed to terraform are located in "/home/sgune/codebase/aks/tg-root/terragrunt-debug.tfvars.json"  prefix=[/home/sgune/codebase/aks/tg-root] 
DEBU[0003] Run this command to replicate how terraform was invoked:  prefix=[/home/sgune/codebase/aks/tg-root] 
DEBU[0003]      terraform -chdir="/home/sgune/codebase/aks/tg-root/.terragrunt-cache/wuWRzEi11mfqxNuxKvMluL2AyNI/8VaC0JuVkfBOg5RLURXh2MMVL38" plan -var-file="/home/sgune/codebase/aks/tg-root/terragrunt-debug.tfvars.json"   prefix=[/home/sgune/codebase/aks/tg-root] 
DEBU[0003] Running command: tofu init                    prefix=[/home/sgune/codebase/aks/tg-root] 

Initializing the backend...

Initializing provider plugins...
- Finding latest version of opentofu/azurerm...
- Installing opentofu/azurerm v3.84.0...
- Installed opentofu/azurerm v3.84.0 (signed, key ID 0C0AF313E5FD9F80)

Providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://opentofu.org/docs/cli/plugins/signing/

OpenTofu has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that OpenTofu can guarantee to make the same selections by default when
you run "tofu init" in the future.

OpenTofu has been successfully initialized!

You may now begin working with OpenTofu. Try running "tofu plan" to see
any changes that are required for your infrastructure. All OpenTofu commands
should now work.

If you ever set or change modules or backend configuration for OpenTofu,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
DEBU[0022] Copying lock file from /home/sgune/codebase/aks/tg-root/.terragrunt-cache/wuWRzEi11mfqxNuxKvMluL2AyNI/8VaC0JuVkfBOg5RLURXh2MMVL38/.terraform.lock.hcl to /home/sgune/codebase/aks/tg-root  prefix=[/home/sgune/codebase/aks/tg-root] 
DEBU[0022] Running command: tofu plan                    prefix=[/home/sgune/codebase/aks/tg-root] 

No changes. Your infrastructure matches the configuration.

OpenTofu has compared your real infrastructure against your configuration and
found no differences, so no changes are needed.
```
</details>

### Azure login
<details><summary>az login</summary>

```diff
A web browser has been opened at https://login.microsoftonline.com/organizations/oauth2/v2.0/authorize. Please continue the login in the web browser. If no web browser is available or if the web browser fails to open, use device code flow with `az login --use-device-code`.
[
  {
    "cloudName": "AzureCloud",
    "homeTenantId": "e53d85a4-e3d4-4de2-9adb-294f70602bcc",
    "id": "0f8ed921-d9a8-41b0-aeca-1b4dbab56daa",
    "isDefault": true,
    "managedByTenants": [],
    "name": "Azure subscription 1",
    "state": "Enabled",
    "tenantId": "e53d85a4-e3d4-4de2-9adb-294f70602bcc",
    "user": {
      "name": "sgune@outlook.com",
      "type": "user"
    }
  }
]
```
</details>

<details><summary>az account show</summary>

```diff
{
  "environmentName": "AzureCloud",
  "homeTenantId": "e53d85a4-e3d4-4de2-9adb-294f70602bcc",
  "id": "0f8ed921-d9a8-41b0-aeca-1b4dbab56daa",
  "isDefault": true,
  "managedByTenants": [],
  "name": "Azure subscription 1",
  "state": "Enabled",
  "tenantId": "e53d85a4-e3d4-4de2-9adb-294f70602bcc",
  "user": {
    "name": "sgune@outlook.com",
    "type": "user"
  }
}
```
</details>

<details><summary>az account list --query</summary>

```diff
az account list --query "[?user.name=='sgune@outlook.com'].{Name:name, ID:id, Default:isDefault}" --output Table
Name                  ID                                    Default
--------------------  ------------------------------------  ---------
Azure subscription 1  <sub id>  True
```
</details>


### Service Principal
- `export MSYS_NO_PATHCONV=1`
- `az ad sp create-for-rbac --name <service_principal_name> --role Contributor --scopes /subscriptions/<subscription_id>`

### Resource Group
`az group create --name <resource-group> --location <location>` 
<details><summary>Group Created</summary>

```diff
az group create --name sgune-rg --location eastus
{
  "id": "/subscriptions/0f8ed921-d9a8-41b0-aeca-1b4dbab56daa/resourceGroups/sgune-rg",
  "location": "eastus",
  "managedBy": null,
  "name": "sgune-rg",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
}
```
</details>

### Storage Account
`az storage account create -n sgunesa -g sgune-rg -l eastus --sku Standard_LRS`
- you need to go to your subscription and register into `Microsoft.Storage` resource provider in order to be able to get a storage account provisioned. 

### Storage Container Create
```
az storage container create \
    --account-name <storage-account> \
    --name <container> \
    --auth-mode login
``` 

### Other keep-in-mind 
- Once you do your AKS deployment, use `terragrunt output kube_config` to get the kubeconfig 
- if you have az cli, you can `az aks get-credentials --resource-group sgune-rg --name sgune-aks-cluster`

## for DNS Zones and cert-manager
```
az aks update \
    --name sgune-aks-cluster \
    --enable-oidc-issuer \
    --enable-workload-identity
```
