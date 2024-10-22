data "aws_secretsmanager_secret_version" "rds_admin_credentials" {
  secret_id = var.rds_instance.admin_credentials_arn
}

// RDS string cred in sm
data "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id = "arn:aws:secretsmanager:ap-northeast-1:034362076319:secret:asdf-KRFMqU"
}

// heroku pg string cred in sm
data "aws_secretsmanager_secret_version" "heroku_database_urls" {
  secret_id = "arn:aws:secretsmanager:ap-northeast-1:034362076319:secret:sssss-8vnKDk"
}
