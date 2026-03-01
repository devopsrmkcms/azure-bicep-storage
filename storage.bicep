targetScope = 'resourceGroup'

resource stg 'Microsoft.Storage/storageAccounts@2025-06-01' = {
  name: 'storageparrotjaipur2026'
  location: 'southindia'
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

resource blobService 'Microsoft.Storage/storageAccounts/blobServices@2025-06-01' = {
  parent: stg
  name: 'default'
}

resource stgcon 'Microsoft.Storage/storageAccounts/blobServices/containers@2025-06-01' = {
  parent: blobService
  name: 'testconstgcon'
  properties: {
    publicAccess: 'None'
  }
}
