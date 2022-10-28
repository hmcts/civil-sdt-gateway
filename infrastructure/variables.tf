# Variables set by Jenkins
variable "product" {
  type = string
  description = "The value of the product variable that is defined in the Jenkinsfile"
}

variable "component" {
  type = string
  description = "The value of the component variable that is defined in the Jenkinsfile"
}

variable "location" {
  type = string
  default = "UK South"
}

variable "env" {
  type = string
  description = "The environment that the build is being run in"
}

variable "subscription" {
  type = string
  description = "The type of environment the build is being run in, typically prod, nonprod or qa"
}

variable "common_tags" {
  type = map(string)
  description = "A set of common variables that can be used in the configuration"
}

variable "aks_subscription_id" {
  type = string
  description = "The AKS subscription id for the environment"
}
