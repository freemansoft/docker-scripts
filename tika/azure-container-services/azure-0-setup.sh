#!/bin/bash
# see ../README.md

# Variables
source azure-variables.sh

# Login to Azure and set the subscription
# Run this when credentials have expired

# echo "login may get browser login panel"
az login

# echo "setting subscription $SubscriptionID"
az account set --subscription $SubscriptionID
