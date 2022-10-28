# Variables set by Jenkins
variable "product" {
  type = string
}

variable "component" {
  type = string
}

variable "location" {
  type = string
  default = "UK South"
}

variable "env" {
  type = string
}

variable "subscription" {
  type = string
}

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
