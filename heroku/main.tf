# Export Environment variables (HEROKU_EMAIL, HEROKU_API_KEY)
# https://www.terraform.io/docs/providers/heroku/index.html#environment-variables
provider "heroku" {}

resource "heroku_app" "main" {
  name   = var.name
  region = var.region
  acm    = var.acm

  config_vars           = var.config_vars
  sensitive_config_vars = var.sensitive_config_vars
  buildpacks            = var.buildpacks
}

resource "heroku_addon" "main" {
  app  = heroku_app.main.name
  plan = var.plan_name
}
