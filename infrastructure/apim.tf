module "api_mgmt_product" {
  source                = "git@github.com:hmcts/cnp-module-api-mgmt-product?ref=master"
  name                  = "${var.my_product}-${var.my_component}"
  approval_required     = "false"
  subscription_required = "false"
  api_mgmt_name         = "cft-api-mgmt-${var.env}"
  api_mgmt_rg           = "cft-${var.env}-network-rg"
  providers             = {
    azurerm = azurerm
  }
}
