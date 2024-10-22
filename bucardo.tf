provider "aws" {
  region = "ap-northeast-1"  # 或者您需要的其他区域
}

module "bucardo_replication" {
  source = "./modules/bucardo"

  rds_vpc = {
    id = "vpc-0bcc17ca4c39e1496"  # 替换为实际的 VPC ID
    cidr_block = "172.31.0.0/16"            # 替换为实际的 VPC CIDR 块
    default_route_table_id = "rtb-019e63e46159130e2"  # 替换为实际的默认路由表 ID
  }

  service_name = "testRDS"       # 替换为您的服务名称
  heroku_pg_major_version = "13"                      # 替换为实际的 PostgreSQL 主版本号

  rds_instance = {
    host = "database-1.cluster-c764kouae2wx.ap-northeast-1.rds.amazonaws.com"  # 替换为实际的 RDS 端点
    admin_credentials_arn = "arn:aws:secretsmanager:ap-northeast-1:034362076319:secret:rds!cluster-2d58a0c3-00ed-47ec-8b76-4e4bfda31edf-7J6TY5"  # 替换为实际的 Secrets Manager ARN
    security_group_id = "sg-0b86c1c00f05209ad"    # 替换为实际的安全组 ID
  }

  environment = "test"

  aws_public_subnet_cidr_block = "172.31.0.0/20"        # 替换为实际的公有子网 CIDR 块
  aws_public_vpc_cidr_block = "172.31.0.0/16"        # 替换为实际的 VPC CIDR 块
}
