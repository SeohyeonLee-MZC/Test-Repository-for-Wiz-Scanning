resource "aws_s3_bucket" "demo_bucket" {
  bucket = "wiz-demo-public-bucket"
}

resource "aws_s3_bucket_public_access_block" "demo_public_access" {
  bucket = aws_s3_bucket.demo_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "demo_acl" {
  depends_on = [aws_s3_bucket_public_access_block.demo_public_access]
  bucket     = aws_s3_bucket.demo_bucket.id
  acl        = "public-read"  
}
