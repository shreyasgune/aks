To get azure secrets to work, you'll need:
- create a managed identity: `az identity create --resource-group sgune-rg --name azure-secrets`
<details><summary>values</summary>

```diff
{
  "clientId": "24b9b47e-9999-4527-b0ab-35904bc12124",
  "id": "/subscriptions/0f8ed921-d9a8-41b0-aeca-1b4dbab56daa/resourcegroups/sgune-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/azure-secrets",
  "location": "eastus",
  "name": "azure-secrets",
  "principalId": "183c6c2a-02b6-4071-b591-0a3c2645467b",
  "resourceGroup": "sgune-rg",
  "systemData": null,
  "tags": {},
  "tenantId": "e53d85a4-e3d4-4de2-9adb-294f70602bcc",
  "type": "Microsoft.ManagedIdentity/userAssignedIdentities"
}
```
</details>
