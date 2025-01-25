locals {
  #---------------------------------------------------------------------------------------------------
  # Subscriptions association to management groups 
  #---------------------------------------------------------------------------------------------------
  caf_configure_mg_subscriptions = {
    root = [

    ],
    decommissioned = [

    ],
    landing-zones = [

    ],
    platform = [

    ],
    connectivity = [
      "<SUBSCRIPTION_ID>",
    ],
    identity = [

    ]
    management = [
      "<SUBSCRIPTION_ID>",
    ],
    sandboxes = [

    ],

    custom = [

    ],
  }

  #---------------------------------------------------------------------------------------------------
  # Configure the custom landing zones to deploy in
  # addition to the core resource hierarchy
  #---------------------------------------------------------------------------------------------------
  caf_configure_custom_landing_zones = {
    "${var.root_id}-custom" = {
      display_name               = "${upper("custom")}"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = local.caf_configure_mg_subscriptions["custom"]
      archetype_config = {
        archetype_id   = "custom"
        parameters     = {}
        access_control = {}
      }
    }
  }
}