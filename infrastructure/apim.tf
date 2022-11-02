locals {
  api_mgmt_name = "cft-api-mgmt-${var.env}"
  api_mgmt_resource_group = "cft-${var.env}-network-rg"
  api_mgmt_product_name = "${var.product}-${var.component}"
  api_mgmt_api_name = "${var.product}-${var.component}-api"
  api_base_path = var.product
  url_civil_sdt_gateway = "http://civil-sdt-gateway-${var.env}.service.core-compute-${var.env}.internal"
  url_swagger = "https://raw.githubusercontent.com/hmcts/reform-api-docs/master/docs/specs/civil-sdt-gateway.json"
}

# Include CNP module for setting up an APIM product
module "api_mgmt_product" {
  source                = "git@github.com:hmcts/cnp-module-api-mgmt-product?ref=master"
  name                  = local.api_mgmt_product_name
  approval_required     = "false"
  subscription_required = "false"
  api_mgmt_name         = local.api_mgmt_name
  api_mgmt_rg           = local.api_mgmt_resource_group
}

# Include CNP module for setting up an API on an APIM product
# Uses output variable from api_mgmt_product to set product_id
# content_format needs to be set to openapi-link as specs (found at swagger_url) are in OpenAPI 3.0.1 format
module "api_mgmt_api" {
  source         = "git@github.com:hmcts/cnp-module-api-mgmt-api?ref=master"
  name           = local.api_mgmt_api_name
  display_name   = "Civil SDT Gateway API"
  api_mgmt_name  = local.api_mgmt_name
  api_mgmt_rg    = local.api_mgmt_resource_group
  product_id     = module.api_mgmt_product.product_id
  path           = local.api_base_path
  service_url    = local.url_civil_sdt_gateway
  protocols      = ["http", "https"]
  swagger_url    = local.url_swagger
  content_format = "openapi-link"
  revision       = "1"
}

# Reference to file containing API policy
data "local_file" "api_policy" {
  filename = "${path.module}/apim-policy/api-policy.xml"
}

# Include CNP module for setting up a policy on an API
# Uses output variable from api_mgmt_api to set api_name
module "api-mgmt-api-policy" {
  source                 = "git@github.com:hmcts/cnp-module-api-mgmt-api-policy?ref=master"
  api_mgmt_name          = local.api_mgmt_name
  api_mgmt_rg            = local.api_mgmt_resource_group
  api_name               = module.api_mgmt_api.name
  api_policy_xml_content = data.local_file.api_policy.content
}
