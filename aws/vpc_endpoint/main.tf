
/*
  VPC Endpoint for S3

  Endpoint for pulling container image.
 */
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "s3"
  vpc_endpoint_type = "Gateway"
}

resource "aws_vpc_endpoint_route_table_association" "private_s3" {
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = element(var.private_route_table_ids, count.index)
}

/*
  VPC Endpoint for ECR DKR

  Endpoint for executing docker command.
 */
resource "aws_vpc_endpoint" "dkr" {
  vpc_id            = var.vpc_id
  service_name      = "ecr.dkr"
  vpc_endpoint_type = "Interface"

  security_group_ids  = var.ecr_dkr_endpoint_security_group_ids
  subnet_ids          = var.private_subnet_ids
  private_dns_enabled = true

  tags = var.tags
}

/*
  VPC Endpoint for logs

  Endpoint for sending logs to CloudWatch Logs
 */
resource "aws_vpc_endpoint" "logs" {
  vpc_id            = var.vpc_id
  service_name      = "logs"
  vpc_endpoint_type = "Interface"

  security_group_ids  = var.logs_endpoint_security_group_ids
  subnet_ids          = var.private_subnet_ids
  private_dns_enabled = true

  tags = var.tags
}

