variable "product" {}

variable "component" {}

variable "location" {
  default = "UK South"
}

variable "env" {}

variable "subscription" {}

variable "deployment_namespace" {}

variable "common_tags" {
  type = "map"
}

# New variables
variable "my_product" {
  type = "string"
  default = "civil"
}

variable "my_component" {
  type = "string"
  default = "sdt-gateway"
}

variable "my_subscription_id" {
  description = "Subscription id for the APIM service.  Set to environment specific value by pipeline."
  type = "string"
}
