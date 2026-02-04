#!/bin/bash

# Define resource group name and location
RESOURCE_GROUP_NAME="myResourceGroup"
LOCATION="eastus"

echo "Creating resource group: $RESOURCE_GROUP_NAME in $LOCATION..."
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

if [ $? -eq 0 ]; then
    echo "Resource group '$RESOURCE_GROUP_NAME' created successfully."
else
    echo "Failed to create resource group '$RESOURCE_GROUP_NAME'."
    exit 1
fi
