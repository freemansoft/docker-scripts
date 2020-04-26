- [Purpose](#purpose)
- [Usage](#usage)
- [Features](#features)
- [Docker Management](#docker-management)
- [IDE Integration](#ide-integration)
- [Azure PaaS container deployments](#azure)
  * [Preconditions](#preconditions)
  * [Tika Parser jar in Azure Container Service](#tika-parser-jar-in-azure-container-service)
    + [Prepare](#prepare)
    + [Deploy](#deploy)
    + [Test](#test)
    + [Teardown](#teardown)
  * [Tika Parser jar in Azure App Service](#tika-parser-jar-in-azure-app-service)
    + [Prepare](#prepare-1)
    + [Deploy](#deploy-1)
    + [Deploy](#deploy-2)
    + [Deploy](#deploy-3)
  * [Tika Parser jar on Azure Service Fabric](#tika-parser-jar-on-azure-service-fabric)
    + [Prepare](#prepare-2)
    + [Execute](#execute)
    + [Test](#test-1)
    + [Teardown](#teardown-1)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>

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


# Azure PaaS container deployments
This section describes simple Azure deployments for _Azure Container Service_, _Azure App Service_ and _Azure Service Fabric_.
None of these deploy with automatic aut-scaling enabled.

## Preconditions
1. Install the CLI - https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest
1. If deploying in azure service fabric you also need
    1. Install sfctl - https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-cli
        1. pip install -I sfctl

## Tika Parser jar in Azure Container Service
Derived from https://docs.microsoft.com/en-us/azure/container-instances/container-instances-quickstart
### Prepare
1. Open a command prompt and cd into ./azure-container-services
1. copy azure-variables.sh-template to azure-variables.sh
1. Edit azure-variable.sh to set your values
1. Windows Bash: If running on Windows using bash uncomment these two lines in azure-variables.sh
    1. shopt -s expand_aliases
    1. alias az='az.cmd'
1. Run script azure-0... to log into Azure and set subscription
### Deploy
1. Run script azure-1... to create the resource group
1. Run script azure-2... to create the container instance deploy the app
    1. This may take 5 minutes
### Test
1. Test the app  with *GET* to http://\<cluster-name>.azurewebsites.com.  The app is running on port 80
1. You can see the configuration built by Azure in the Azure Portal for the App Service --> Settings --> Export Template
### Teardown
1. Run script azure-3... to destroy the container instance and undeploy the app
1. Run script azure-4... to teardown the resource group.  
    1. This may take 5 minutes

## Tika Parser jar in Azure App Service
Derived from https://docs.microsoft.com/en-us/azure/app-service/containers/quickstart-docker
### Prepare
1. Open a command prompt and cd into ./azure-service-fabric
1. copy azure-variables.sh-template to azure-variables.sh
1. Edit azure-variable.sh to set your values
1. Windows Bash: If running on Windows using bash uncomment these two lines in azure-variables.sh
    1. shopt -s expand_aliases
    1. alias az='az.cmd'
1. Run script azure-0... to log into Azure and set subscription
### Deploy
1. Run script azure-1... to create the resource group and and App Plan
1. Run script azure-2... to deploy the app
    1. This may take 5 minutes
### Deploy
1. Test the app  with *GET* to http://\<cluster-name>.azurewebsites.com.  The app is running on port 80
1. You can see the configuration built by Azure in the Azure Portal for the App Service --> Settings --> Export Template
### Deploy
1. Run script azure-3... to undeploy the app
1. Run script azure-4... to teardown the resource group.  
    1. This may take 5 minutes

## Tika Parser jar on Azure Service Fabric
Derived from https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-quickstart-containers-linux
### Prepare
1. Open a command prompt and cd into ./azure-service-fabric
1. copy azure-variables.sh-template to azure-variables.sh
1. Edit azure-variable.sh to set your values
1. Windows Bash: If running on Windows using bash uncomment these two lines in azure-variables.sh
    1. shopt -s expand_aliases
    1. alias az='az.cmd'
1. Run script azure-0... to log into Azure and set subscription
### Execute
1. Run script azure-1... to create the resource group and ServiceFabric cluster. 
    1. This may take 20 minutes
    1. Will start a 5 node cluster and deploy app
1. Run script azure-2... to deploy the app
### Test
1. Test the app  with *GET* to http://\<cluster-name>.\<region>.cloudapp.azure.com.  The app is running on port 80
### Teardown
1. Run script azure-3... to undeploy the app
1. Run script azure-4... to teardown the resource group.  
    1. This may take 20 minutes


