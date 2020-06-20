resource "random_id" "db_password" {
  byte_length = 20
}

locals {
  db_password = length(var.database_password) > 0 ? var.database_password : random_id.db_password.b64
}

resource "aws_rds_cluster" "default" {
  cluster_identifier      = var.identifier
  master_username         = var.username
  master_password         = local.db_password
  availability_zones      = var.availability_zones
  engine                  = var.engine
  engine_version          = var.engine_versio
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  tags                    = var.tags
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = var.instance_count
  identifier         = var.identifier
  cluster_identifier = aws_rds_cluster.default.id
  instance_class     = var.instance_class
  tags               = var.tags
}
