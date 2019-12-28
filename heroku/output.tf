output "name" {
  value = heroku_app.main.name
}

output "region" {
  value = heroku_app.main.region
}

output "config_vars" {
  value = heroku_app.main.config_vars
}

output "buildpacks" {
  value = heroku_app.main.buildpacks
}

output "database_plan" {
  value = heroku_addon.database.plan
}
