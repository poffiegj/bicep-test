
@description('bicep deployment test')
@minLength(3)
@maxLength(22)
param projectName string = 'bicepdeployteststorage'

@description('Deployment Location')
@allowed([
  'westeurope'
  'northeurope'
])
param location string = 'westeurope'

@allowed([
  'Standard_LRS'
])
param stSKU string = 'Standard_LRS'

// This function ensures that the name is stored in lowercase.
var storageAccountName = toLower('st${projectName}')

resource st 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: stSKU
  }
  kind: 'StorageV2'
   properties: {
     accessTier: 'Hot'
   }

}

output storageAccountId string = st.id
output storageAccountName string = st.name
