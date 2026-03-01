targetScope = 'subscription'
resource biceprgtest 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: 'biceprgtest'
  location: 'southindia'
}
