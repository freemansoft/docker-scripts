#!/bin/bash
#from https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-quickstart-containers-linux

# Variables
source azure-variables.sh

# delete resource group $ResourceGroupName and everything in it
echo "deleting resource group - can take a long time"
az group delete --name $ResourceGroupName --yes
