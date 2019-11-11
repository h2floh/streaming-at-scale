#!/bin/bash

# Strict mode, fail on any error
set -euo pipefail

# remove - characters
AZURE_STORAGE_ACCOUNT=`echo $AZURE_STORAGE_ACCOUNT | sed 's/\-//g' `
# cut length to 23 characters
AZURE_STORAGE_ACCOUNT=${AZURE_STORAGE_ACCOUNT:0:23}
# only lowercase allowed
AZURE_STORAGE_ACCOUNT=${AZURE_STORAGE_ACCOUNT,,}

echo 'creating storage account'
echo ". name: $AZURE_STORAGE_ACCOUNT"

az storage account create -n $AZURE_STORAGE_ACCOUNT -g $RESOURCE_GROUP \
    --kind StorageV2 --sku Standard_LRS \
    -o tsv >> log.txt
