#!/bin/bash
# see ../README.md

# Variables
source azure-variables.sh

# Create resource group $ResourceGroupName
echo "creating resource group $ResourceGroupName"
az group create \
    --name $ResourceGroupName \
    --location $Location 


