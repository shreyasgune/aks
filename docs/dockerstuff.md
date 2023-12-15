# scratch space for my docker stuff

- `docker build -t gman-tofu:0.1 .`
- `docker run -it -v $(pwd)/tg-root:/tg-root gman-tofu:0.1 bash`
- `TERRAGRUNT_DEBUG=1 terragrunt init --terragrunt-log-level debug --terragrunt-debug`
-         
```
        ARM_SUBSCRIPTION_ID: ${{ secrets.ARM_SUBSCRIPTION_ID }}
        ARM_TENANT_ID: ${{ secrets.ARM_TENANT_ID }}
        ARM_CLIENT_ID: ${{ secrets.ARM_CLIENT_ID }}
        ARM_CLIENT_SECRET : ${{ secrets.ARM_CLIENT_SECRET }}
```
        export ARM_SUBSCRIPTION_ID: ${{ secrets.ARM_SUBSCRIPTION_ID }}
        export ARM_TENANT_ID: ${{ secrets.ARM_TENANT_ID }}
        export ARM_CLIENT_ID: ${{ secrets.ARM_CLIENT_ID }}
        export ARM_CLIENT_SECRET : ${{ secrets.ARM_CLIENT_SECRET }}