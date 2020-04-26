#!/bin/bash
#from https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-quickstart-containers-linux

# Variables
source azure-variables.sh

az webapp delete \
    --name $ClusterName \
    --resource-group $ResourceGroupName 
