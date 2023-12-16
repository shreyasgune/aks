## Installing Certmanager

helm upgrade --debug --install --create-namespace --namespace cert-manager --dry-run --cleanup-on-fail cert-manager -f /home/sgune/codebase/aks/helm-stuff/bootstraper/charts/cert-manager/Values.yaml /home/sgune/codebase/aks/helm-stuff/bootstraper/charts/cert-manager

helm upgrade --debug --install --create-namespace --namespace cert-manager --cleanup-on-fail cert-manager -f /home/sgune/codebase/aks/helm-stuff/bootstraper/charts/cert-manager/Values.yaml /home/sgune/codebase/aks/helm-stuff/bootstraper/charts/cert-manager


