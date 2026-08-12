variable "resource_group_name" {
  default = "rg-cosmos-test-tf"
  type    = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "swedencentral"
}

# sql-like syntax
resource "azurerm_cosmosdb_sql_database" "db" {
  name                = "FilmReviewDB"
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_cosmosdb_account.acc.name
}

resource "azurerm_cosmosdb_sql_container" "films_container" {
  name                  = "Films"
  resource_group_name   = azurerm_resource_group.rg.name
  account_name          = azurerm_cosmosdb_account.acc.name
  database_name         = azurerm_cosmosdb_sql_database.db.name
  partition_key_paths   = ["/year"]
  partition_key_version = 2
}
