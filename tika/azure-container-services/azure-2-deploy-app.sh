#!/bin/bash
# see ../README.md

# Variables
source azure-variables.sh

echo "Creating container group $ClusterName "
az container create \
    --resource-group $ResourceGroupName \
    --name $ClusterName \
    --image apache/tika:latest \
    --dns-name-label $ClusterName-dev \
    --cpu 2
    --memory 3.5
    --ports 9998

# Show the URL
az container show --resource-group $ResourceGroupName --name $ClusterName \
    --query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" --out table

