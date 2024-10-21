module "bucardo_replication" {
  source = "./modules/bucardo"

  rds_vpc = {
    id = "vpc-xxxxxxxxxxxxxxxxx"  # 替换为实际的 VPC ID
    cidr_block = "10.0.0.0/16"            # 替换为实际的 VPC CIDR 块
    default_route_table_id = "rtb-xxxxxxxxxxxxxxxxx"  # 替换为实际的默认路由表 ID
  }

  service_name = "your_service_name"       # 替换为您的服务名称
  heroku_pg_major_version = "13"                      # 替换为实际的 PostgreSQL 主版本号

  rds_instance = {
    host = "your-rds-endpoint.rds.amazonaws.com"  # 替换为实际的 RDS 端点
    admin_credentials_arn = "arn:aws:secretsmanager:region:account-id:secret:secret-name"  # 替换为实际的 Secrets Manager ARN
    security_group_id = "sg-xxxxxxxxxxxxxxxxx"    # 替换为实际的安全组 ID
  }

  environment = "test"

  aws_public_subnet_cidr_block = "10.0.1.0/24"        # 替换为实际的公有子网 CIDR 块
  aws_public_vpc_cidr_block = "10.0.0.0/16"        # 替换为实际的 VPC CIDR 块
}

output "debug_file_path" {
  value = "${path.module}/scripts/setup.sh.tftpl"
}