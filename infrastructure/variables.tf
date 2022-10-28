variable "product" {}

variable "component" {}

variable "location" {
  default = "UK South"
}

variable "env" {}

variable "subscription" {}

variable "common_tags" {
  type = map(string)
}

# New variables
variable "my_product" {
  type = string
  default = "civil"
}

variable "my_component" {
  type = string
  default = "sdt-gateway"
}

variable "my_subscription_id" {
  type = string
  description = "Subscription id.  Set to environment specific value by pipeline."
}
