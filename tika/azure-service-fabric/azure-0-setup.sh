#!/bin/bash
#from https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-quickstart-containers-linux

# Variables
source azure-variables.sh

# Login to Azure and set the subscription
# This does not actually have to happen on every run if your credentials are still valid

echo "login may get browser login panel"
az login

echo "setting subscription $SubscriptionID"
az account set --subscription $SubscriptionID
