#!/bin/bash
# see ../README.md

# Variables
source azure-variables.sh

az webapp delete \
    --name $ClusterName \
    --resource-group $ResourceGroupName 
