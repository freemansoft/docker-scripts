# Purpose
* Run apache/tika document parse
* Exists as docker-compose because this works with azure CLI
* Guide: (Apache Tika) https://tika.apache.org/

# Usage
* docker-compose up
* docker-compose down

# Features
* Azure Service Fabric deployment in azure-service-fabric

# Docker Management
See README.md in the [root of this repo](../README.md) for interesting docker commands.

# IDE Integration
No IDE integrations specific to this project are called out at this time.


# Deploy Tika Parser jar on Azure Service Fabric
https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-quickstart-containers-linux

## Preconditions
1. Install the CLI - https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest
1. Install sfctl - https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-cli
    1. pip install -I sfctl
## Deploy
1. Open a command prompt and cd into ./azure-service-fabric
1. copy azure-variables.sh-template to azure-variables.sh
1. Edit azure-variable.sh to set your values
1. If running on Windows using bash uncomment these two lines in azure-variables.sh
    1. shopt -s expand_aliases
    1. alias az='az.cmd'
1. Run Numeric script #1 to create the resource group and ServiceFabric cluster. 
    1. This may take 20 minutes
    1. Will start a 5 node cluster and deploy app
1. Run Numeric script #2 to deploy the app
## Test
1. Test the app  with *GET* to port 80 http://\<cluster-name>.\<region>.cloudapp.azure.com.  The app is running on port 80
## Teardown
1. Run numeric script 3 to undeploy the app
1. Run numeric script 4 to teardown the resource group.  
    1. This may take 20 minutes


