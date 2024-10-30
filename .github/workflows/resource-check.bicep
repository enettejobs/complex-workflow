@description('Name of the resource')
param resourceName string

@description('Location for all resources.')
param location string = resourceGroup().location

resource existingResource 'Microsoft.Resources/resourceGroups@2022-09-01' existing = {
  name: resourceName
}

var resourceExists = existingResource.id != null

output resourceExists bool = resourceExists
output resourceId string = resourceExists ? existingResource.id : 'Resource not found'
