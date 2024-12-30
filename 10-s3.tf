# S3 Bucket
resource "aws_s3_bucket" "private_bucket" {
  bucket = "private-app-bucket"

  tags = {
    Name        = "Private S3 Bucket"
    Environment = "Test"
  }
}