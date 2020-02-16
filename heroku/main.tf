# Export Environment variables (HEROKU_EMAIL, HEROKU_API_KEY)
# https://www.terraform.io/docs/providers/heroku/index.html#environment-variables
provider "heroku" {}

resource "heroku_app" "main" {
  name   = var.name
  region = var.region

  config_vars = var.config_vars
  buildpacks  = var.buildpacks
}

resource "heroku_addon" "database" {
  app  = heroku_app.main.name
  plan = var.database_plan
}

resource "heroku_addon" "sendgrid" {
  app  = heroku_app.main.name
  plan = var.sendgrid_plan
}
