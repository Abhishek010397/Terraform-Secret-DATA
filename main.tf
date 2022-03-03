data "aws_secretsmanager_secret" "consul-token" {
  arn = "arn:aws:secretsmanager:us-east-1:<<your-secret-arn>>"
}

data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.consul-token.id
}

module "s3" {
  source = "./module/s3"
  tag_name   = data.aws_secretsmanager_secret_version.current.secret_string
}
