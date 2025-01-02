terraform {
  # Backend configuration
  backend "local" {
    path = "core.tfstate"
  }
}