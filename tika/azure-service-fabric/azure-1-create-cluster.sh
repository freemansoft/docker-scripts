#!/bin/bash
#from https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-quickstart-containers-linux

# Variables
source azure-variables.sh

# Create resource group $ResourceGroupName
echo "creating resource group"
az group create --name $ResourceGroupName --location $Location 

# Create secure five node Linux cluster. Creates a key vault in a resource group
# and creates a certficate in the key vault. The certificate's subject name must match 
# the domain that you use to access the Service Fabric cluster.  The certificate is downloaded locally.
# see os types with
#  az sf cluster create --help
echo "creating cluster $ClusterName in $Location using $ResourceGroupName - be patient this couild take 20 minutes"
az sf cluster create \
    --resource-group $ResourceGroupName \
    --location $Location \
    --certificate-output-folder . --certificate-password $CertificatePassword --certificate-subject-name $ClusterName.$Location.cloudapp.azure.com \
    --cluster-name $ClusterName --cluster-size 5 --os UbuntuServer1604 \
    --vault-name $VaultName --vault-resource-group $ResourceGroupName \
    --vm-password $VmPassword --vm-user-name $VmUserName
