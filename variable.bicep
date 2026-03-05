param location string = resourceGroup().location
param storagePrefix string = 'stg'

// Variables for reuse across resources
var storageName = '${toLower(storagePrefix)}${uniqueString(resourceGroup().id)}'
var commonTags = {
  environment: 'dev'
  deployedBy: 'bicep'
  project: 'demo'
}
var skuName = 'Standard_LRS'

// Storage Account resource using variables
resource stgAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageName
  location: location
  sku: {
    name: skuName
  }
  kind: 'StorageV2'
  tags: commonTags
}

@description('Generated storage account name')
output storageAccountName string = storageName

//
# Basic deployment
az deployment group create \
  --resource-group myResourceGroup \
  --template-file storage.bicep \
  --parameters location='eastus' storagePrefix='mystg'

# With parameter file (create storage.bicepparam)
az deployment group create \
  --resource-group myResourceGroup \
  --template-file storage.bicep \
  --parameters storage.bicepparam

