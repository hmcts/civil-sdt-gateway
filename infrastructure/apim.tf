# Include CNP module for setting up APIM product
module "api_mgmt_product" {
  source                = "git@github.com:hmcts/cnp-module-api-mgmt-product?ref=master"
  name                  = "${var.product}-${var.component}"
  approval_required     = "false"
  subscription_required = "false"
  api_mgmt_name         = "cft-api-mgmt-${var.env}"
  api_mgmt_rg           = "cft-${var.env}-network-rg"
  product_access_control_groups = ["developers"]
}
