#!/bin/bash

# Variables
RESOURCE_GROUP_NAME="jnc-resource-group"
LOCATION="westeurope"
VM_NAME="MyVM"
IMAGE="Ubuntu2204"
SIZE="Standard_B1s"
ADMIN_USERNAME="azureuser"
ADMIN_PASSWORD="yourP@assw0rd123" 

echo "Creating resource group..."
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

echo "Creating virtual machine..."
az vm create \
    --resource-group $RESOURCE_GROUP_NAME \
    --name $VM_NAME \
    --image $IMAGE \
    --size $SIZE \
    --admin-username $ADMIN_USERNAME \
    --admin-password $ADMIN_PASSWORD

echo "Resources created successfully."