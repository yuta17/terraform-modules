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

resource "heroku_addon" "database" {
  count = var.database_count

  app  = heroku_app.main.name
  plan = var.database_plan
}

resource "heroku_addon" "sendgrid" {
  count = var.sendgrid_count

  app  = heroku_app.main.name
  plan = var.sendgrid_plan
}

resource "heroku_addon" "rollbar" {
  count = var.rollbar_count

  app  = heroku_app.main.name
  plan = var.rollbar_plan
}
