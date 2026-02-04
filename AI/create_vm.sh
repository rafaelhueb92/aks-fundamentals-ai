#!/bin/bash

# Define variables
RESOURCE_GROUP_NAME="myResourceGroup"
VM_NAME="myCheapestVM"
LOCATION="eastus"
VM_IMAGE="Ubuntu2204" # Corrected: Using Ubuntu Server 22.04 LTS
VM_SIZE="Standard_B1ls" # Corrected: Using Standard_B1ls, likely the cheapest available
ADMIN_USERNAME="azureuser"
# Generate a random password for the VM
VM_PASSWORD=$(openssl rand -base64 12)

echo "Creating VM '$VM_NAME' in resource group '$RESOURCE_GROUP_NAME' in $LOCATION..."
echo "VM Size: $VM_SIZE"
echo "Admin Username: $ADMIN_USERNAME"

# Create the VM
az vm create \
    --resource-group $RESOURCE_GROUP_NAME \
    --name $VM_NAME \
    --location $LOCATION \
    --image $VM_IMAGE \
    --size $VM_SIZE \
    --admin-username $ADMIN_USERNAME \
    --admin-password $VM_PASSWORD \
    --no-wait # Run in background

if [ $? -eq 0 ]; then
    echo "VM '$VM_NAME' creation initiated successfully."
    echo "You can check its status with: az vm show -d -g $RESOURCE_GROUP_NAME -n $VM_NAME --query "powerState" -o tsv"
    echo "Admin password for $VM_NAME: $VM_PASSWORD"
else
    echo "Failed to initiate VM '$VM_NAME' creation."
    exit 1
fi
