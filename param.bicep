// creates a storage account using a parameter for the name 
param storageName string = 'mystorage${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location

resource stg 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

/*Deploy it with: az deployment group create --resource-group myRG --template-file main.bicep --parameters 
storageName='myCustomName'. Here, storageName is a parameter you customize, making the template flexible
