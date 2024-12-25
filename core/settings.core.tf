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
      "<SUBSCRIPTION_ID>",
    ],
    platform = [
      "<SUBSCRIPTION_ID>",
    ],
    connectivity = [

    ],
    identity = [

    ]
    management = [

    ],
    sandboxes = [

    ],
  }
}