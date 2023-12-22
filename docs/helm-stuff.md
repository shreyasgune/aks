## Installing Certmanager

helm upgrade --debug --install --create-namespace --namespace cert-manager --dry-run --cleanup-on-fail cert-manager -f /home/sgune/codebase/aks/helm-stuff/bootstraper/charts/cert-manager/Values.yaml /home/sgune/codebase/aks/helm-stuff/bootstraper/charts/cert-manager

helm upgrade --debug --install --create-namespace --namespace cert-manager --cleanup-on-fail cert-manager -f /home/sgune/codebase/aks/helm-stuff/bootstraper/charts/cert-manager/Values.yaml /home/sgune/codebase/aks/helm-stuff/bootstraper/charts/cert-manager

## Installing NGINX INGRESS
helm upgrade --debug --install --create-namespace --namespace nginx-ingress --dry-run --cleanup-on-fail nginx-ingress -f /home/sgune/codebase/aks/helm-stuff/bootstraper/charts/nginx-ingress/Values.yaml /home/sgune/codebase/aks/helm-stuff/bootstraper/charts/nginx-ingress

helm upgrade --debug --install --create-namespace --namespace nginx-ingress --cleanup-on-fail nginx-ingress -f /home/sgune/codebase/aks/helm-stuff/bootstraper/charts/nginx-ingress/Values.yaml /home/sgune/codebase/aks/helm-stuff/bootstraper/charts/nginx-ingress


## ArgoCD stuff
- create secret
```
kubectl apply -n argocd -f /home/sgune/codebase/aks/kube/argocd-stuff/secret.yaml
  

```
- helm install
helm upgrade --debug --install --create-namespace --namespace argocd --cleanup-on-fail argocd -f /home/sgune/codebase/aks/helm-stuff/bootstraper/charts/argocd/Values.yaml /home/sgune/codebase/aks/helm-stuff/bootstraper/charts/argocd

- get password for admin
`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`

- install sample argocd application
`k apply -f /home/sgune/codebase/aks/kube/argocd-stuff/application.yaml`