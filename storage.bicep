param location string = resourceGroup().location

@minLength(3)
@maxLength(24)
param storageName string

var storageNameLower = toLower(storageName)

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageNameLower
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'standard_LRS'
  }
  properties: {
    accessTier: 'Cool'
    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'AzureServices'
    }
  }
}
