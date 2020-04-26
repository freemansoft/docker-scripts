#!/bin/bash
# see ../README.md

# Variables
source azure-variables.sh

az container delete \
    --resource-group $ResourceGroupName \
    --name $ClusterName \
    --yes
