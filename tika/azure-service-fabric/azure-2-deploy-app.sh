#!/bin/bash
#from https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-quickstart-containers-linux

# Variables
source azure-variables.sh

# pem file name is autogenerated from certificate subject name
echo "binding to cluster endpoint https://$ClusterName.$Location.cloudapp.azure.com:19080"
sfctl cluster select --endpoint https://$ClusterName.$Location.cloudapp.azure.com:19080 --pem ${ClusterName}${Location}cloudappazurecom.pem --no-verify

echo "deploying docker image to $ClusterName-test on url http://$ClusterName.$Location.cloudapp.azure.com"
sfctl compose create --deployment-name $ClusterName-test --file-path ../docker-compose.yml

