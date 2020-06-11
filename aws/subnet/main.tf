# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id
  tags   = var.tags
}

# Subnets
resource "aws_subnet" "public" {
  count = length(var.public_cidr_blocks)

  vpc_id                  = var.vpc_id
  cidr_block              = var.public_cidr_blocks[count.index]
  map_public_ip_on_launch = true
  availability_zone       = element(var.availability_zones, count.index)
  tags                    = var.tags
}

resource "aws_subnet" "private" {
  count = length(var.private_cidr_blocks)

  vpc_id                  = var.vpc_id
  cidr_block              = var.private_cidr_blocks[count.index]
  map_public_ip_on_launch = false
  availability_zone       = element(var.availability_zones, count.index)
  tags                    = var.tags
}

# Route Tables
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  tags   = var.tags
}

resource "aws_route_table" "private" {
  count = length(var.private_cidr_blocks)

  vpc_id = var.vpc_id
  tags   = var.tags
}

# Route Table Association
resource "aws_route_table_association" "public" {
  count = length(var.public_cidr_blocks)

  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_cidr_blocks)

  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}

# Routes
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.main.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "private" {
  count = length(var.private_cidr_blocks)

  route_table_id         = element(aws_route_table.private.*.id, count.index)
  nat_gateway_id         = var.nat_gateways_count == 0 ? null : element(aws_nat_gateway.main.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
}

# NAT Gateway
resource "aws_eip" "nat_gateway" {
  count = var.nat_gateways_count

  vpc        = true
  depends_on = [aws_internet_gateway.main]
  tags       = var.tags
}

resource "aws_nat_gateway" "main" {
  count = var.nat_gateways_count

  allocation_id = element(aws_eip.nat_gateway.*.id, count.index)
  subnet_id     = element(aws_subnet.public.*.id, count.index)
  depends_on    = [aws_internet_gateway.main]
  tags          = var.tags
}
