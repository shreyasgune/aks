```
{
    "id": "/subscriptions/0f8ed921-d9a8-41b0-aeca-1b4dbab56daa/resourcegroups/sgune-rg/providers/Microsoft.ContainerService/managedClusters/sgune-aks-cluster",
    "location": "eastus",
    "name": "sgune-aks-cluster",
    "type": "Microsoft.ContainerService/ManagedClusters",
    "properties": {
        "provisioningState": "Starting",
        "powerState": {
            "code": "Running"
        },
        "kubernetesVersion": "1.27.7",
        "currentKubernetesVersion": "1.27.7",
        "dnsPrefix": "dns-supreme-lark",
        "fqdn": "dns-supreme-lark-yu49vjjm.hcp.eastus.azmk8s.io",
        "azurePortalFQDN": "dns-supreme-lark-yu49vjjm.portal.hcp.eastus.azmk8s.io",
        "agentPoolProfiles": [
            {
                "name": "agentpool",
                "count": 0,
                "vmSize": "Standard_D2a_v4",
                "osDiskSizeGB": 128,
                "osDiskType": "Managed",
                "kubeletDiskType": "OS",
                "maxPods": 110,
                "type": "VirtualMachineScaleSets",
                "enableAutoScaling": false,
                "scaleDownMode": "Delete",
                "provisioningState": "Starting",
                "powerState": {
                    "code": "Running"
                },
                "orchestratorVersion": "1.27.7",
                "currentOrchestratorVersion": "1.27.7",
                "enableNodePublicIP": false,
                "mode": "System",
                "enableEncryptionAtHost": false,
                "enableUltraSSD": false,
                "osType": "Linux",
                "osSKU": "Ubuntu",
                "nodeImageVersion": "AKSUbuntu-2204gen2containerd-202312.06.0",
                "upgradeSettings": {},
                "enableFIPS": false
            }
        ],
        "linuxProfile": {
            "adminUsername": "sgune",
            "ssh": {
                "publicKeys": [
                    {
                        "keyData": "ssh-rsa redacted-by-me"
                    }
                ]
            }
        },
        "servicePrincipalProfile": {
            "clientId": "msi"
        },
        "nodeResourceGroup": "MC_sgune-rg_sgune-aks-cluster_eastus",
        "enableRBAC": true,
        "supportPlan": "KubernetesOfficial",
        "networkProfile": {
            "networkPlugin": "kubenet",
            "loadBalancerSku": "Standard",
            "loadBalancerProfile": {
                "managedOutboundIPs": {
                    "count": 1
                },
                "effectiveOutboundIPs": [
                    {
                        "id": "/subscriptions/0f8ed921-d9a8-41b0-aeca-1b4dbab56daa/resourceGroups/MC_sgune-rg_sgune-aks-cluster_eastus/providers/Microsoft.Network/publicIPAddresses/7cfb5986-dd58-4ad8-b2a7-04beffcd311e"
                    }
                ]
            },
            "podCidr": "10.244.0.0/16",
            "serviceCidr": "10.0.0.0/16",
            "dnsServiceIP": "10.0.0.10",
            "outboundType": "loadBalancer",
            "podCidrs": [
                "10.244.0.0/16"
            ],
            "serviceCidrs": [
                "10.0.0.0/16"
            ],
            "ipFamilies": [
                "IPv4"
            ]
        },
        "maxAgentPools": 100,
        "identityProfile": {
            "kubeletidentity": {
                "resourceId": "/subscriptions/0f8ed921-d9a8-41b0-aeca-1b4dbab56daa/resourcegroups/MC_sgune-rg_sgune-aks-cluster_eastus/providers/Microsoft.ManagedIdentity/userAssignedIdentities/sgune-aks-cluster-agentpool",
                "clientId": "759aef59-f704-4e05-962b-564db0085905",
                "objectId": "2508d2b7-17bb-4697-8d40-8cc5d62cbac7"
            }
        },
        "autoUpgradeProfile": {
            "upgradeChannel": "none"
        },
        "disableLocalAccounts": false,
        "securityProfile": {
            "imageCleaner": {
                "enabled": false,
                "intervalHours": 48
            },
            "workloadIdentity": {
                "enabled": true
            }
        },
        "storageProfile": {
            "diskCSIDriver": {
                "enabled": true
            },
            "fileCSIDriver": {
                "enabled": true
            },
            "snapshotController": {
                "enabled": true
            }
        },
        "oidcIssuerProfile": {
            "enabled": true,
            "issuerURL": "https://eastus.oic.prod-aks.azure.com/e53d85a4-e3d4-4de2-9adb-294f70602bcc/0a308626-b74b-435f-bfc4-c4d3deb2dbce/"
        },
        "workloadAutoScalerProfile": {},
        "azureMonitorProfile": {
            "metrics": {
                "enabled": false
            }
        }
    },
    "identity": {
        "type": "SystemAssigned",
        "principalId": "bb0d832f-bff1-4926-af62-7d0bd173c4f4",
        "tenantId": "e53d85a4-e3d4-4de2-9adb-294f70602bcc"
    },
    "sku": {
        "name": "Base",
        "tier": "Free"
    }
}

```