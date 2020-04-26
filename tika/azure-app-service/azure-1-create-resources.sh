#!/bin/bash
#from https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-quickstart-containers-linux

# Variables
source azure-variables.sh

# Create resource group $ResourceGroupName
echo "creating resource group $ResourceGroupName"
az group create --name $ResourceGroupName --location $Location 

echo "Creating App Service Plan $AppPlanName in resource group $ResourceGroupName"
az appservice plan create --name $AppPlanName --resource-group $ResourceGroupName --location $Location --is-linux --sku B2

