#!/bin/bash

echo "Installing plugins..."

# Download the JFrog CLI binary
curl -fL https://getcli.jfrog.io | sh

# Move the binary to /usr/local/bin
sudo mv jfrog /usr/local/bin/jfrog
export JFROG_CLI_OFFER_CONFIG=false

# Verify the installation
jfrog --version

echo "JFrog CLI installed successfully."

USERNAME=$ARTIFACTORY_USERNAME
PASSWORD=$ARTIFACTORY_TOKEN
jfrog rt dl "ai-assist-dist-scratch/test/deloitte-ai-assistant-2.2.0.vsix" --user=$USERNAME --password=$PASSWORD --url  https://deloitte.jfrog.io/artifactory/

echo "Current user before installing the extension: \$(whoami)"
code --version
code --install-extension test/deloitte-ai-assistant-2.2.0.vsix
code --list-extensions
