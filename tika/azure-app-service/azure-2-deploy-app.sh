#!/bin/bash
#from https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-quickstart-containers-linux

# Variables
source azure-variables.sh

# Could do this into a staging slot and then swap after port change
# https://docs.microsoft.com/en-us/azure/app-service/scripts/cli-deploy-staging-environment?toc=/cli/azure/toc.json
echo "Creating Web App $AppPlanName"
az webapp create \
    --name $ClusterName \
    --resource-group $ResourceGroupName \
    --plan $AppPlanName \
    --deployment-container-image-name apache/tika:latest
# I couldn't get docker-compose file to work 4/2020 - not sure if it is port related or something else
#    --multicontainer-config-file ../docker-compose.yml \
#    --multicontainer-config-type COMPOSE

echo "Changing port to 9998"
az webapp config appsettings set \
    --name $ClusterName \
    --resource-group $ResourceGroupName \
    --settings WEBSITES_PORT=9998

# Copy the result of the following command into a browser to see the web app.
echo http://$ClusterName.azurewebsites.net
