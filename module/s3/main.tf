resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-bucket"
  tags = {
    Name        = var.tag_name
    Environment = "Dev"
  }
}