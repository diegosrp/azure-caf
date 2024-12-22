# Variables should be defined in the tfvars file

# Base module variables settings
variable "root_id" {
  description = "Sets the value used for generating unique resource naming within the module."
  type        = string
}

variable "root_name" {
  description = "Sets the value used for the \"intermediate root\" management group display name."
  type        = string
}

variable "primary_location" {
  description = "Sets the location for \"primary\" resources to be created in."
  type        = string
}

# Subscriptions used for CAF
variable "subscriptions_ids" {
  description = "Subscriptions used for CAF"
  type = object({
    core         = string
    connectivity = string
    management   = string
    identity     = string
  })
}