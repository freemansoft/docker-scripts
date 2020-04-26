#!/bin/bash
#from https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-quickstart-containers-linux

# Variables
source azure-variables.sh

# Login to Azure and set the subscription
# Run this when credentials have expired

# echo "login may get browser login panel"
az login

# echo "setting subscription $SubscriptionID"
az account set --subscription $SubscriptionID
