#!/bin/bash

# Variables
let "randomIdentifier=$RANDOM"
RESOURCE_GROUP_NAME="jnc-func-resource-group"
FUNCTION_APP_NAME="MyFuncApp-$randomIdentifier"
LOCATION="westeurope"
FUNCTION_NAME="MyFuncName-$randomIdentifier"
STORAGE_ACCOUNT_NAME="mystorageaccount$randomIdentifier"

echo "Creating resource group.."
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

echo "Creating storage account..."
az storage account create \
    --name $STORAGE_ACCOUNT_NAME \
    --location $LOCATION \
    --resource-group $RESOURCE_GROUP_NAME \
    --sku Standard_LRS


echo "Creating Function App..."
az functionapp create \
    --name $FUNCTION_APP_NAME \
    --storage-account $STORAGE_ACCOUNT_NAME \
    --consumption-plan-location $LOCATION \
    --resource-group $RESOURCE_GROUP_NAME \
    --runtime dotnet \
    --functions-version 4

echo "Azure Function created successfully."