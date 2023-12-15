FROM debian:12-slim

# Install Terraform and Terragrunt using tfenv and tgenv
RUN apt-get update \
    && apt-get install -y \
        curl \
        jq \
        ca-certificates \
        unzip


# Install Tofu
RUN curl --proto '=https' --tlsv1.2 -fsSL 'https://packages.opentofu.org/install/repositories/opentofu/tofu/script.deb.sh?any=true' -o /tmp/tofu-repository-setup.sh

# Inspect the downloaded script at /tmp/tofu-repository-setup.sh before running

RUN bash /tmp/tofu-repository-setup.sh
RUN rm /tmp/tofu-repository-setup.sh

RUN apt-get install tofu

# Install Terragrunt using curl
RUN curl -L -o /usr/local/bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.54.0/terragrunt_linux_amd64 \
    && chmod +x /usr/local/bin/terragrunt

# Install AZ CLI 
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Clean up unnecessary files
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

# Set the working directory
WORKDIR /root

# Set the entry point
CMD ["/bin/bash"]
