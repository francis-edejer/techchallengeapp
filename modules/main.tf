# Main vpc provider
provider "aws" {
}

provider "vault" {
}

data "vault_generic_secret" "db" {
  path = "test/test/password"
}