resource "azurerm_cosmosdb_account" "acc" {
  name                = "cosmos-acc-${random_string.suffix.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  # no geo redundancy
  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
  }
  # same client session, always read own writes, reads don't go backward
  consistency_policy {
    consistency_level = "Session"
  }

  capabilities {
    name = "EnableServerless"
  }
}
