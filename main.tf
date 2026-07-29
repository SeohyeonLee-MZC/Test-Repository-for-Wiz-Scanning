resource "aws_s3_bucket" "demo_bucket" {
  bucket = "wiz-demo-public-bucket"
}

resource "aws_s3_bucket_acl" "demo_acl" {
  bucket = aws_s3_bucket.demo_bucket.id
  acl    = "public-read"  # ← 이 부분이 정책 위반
}
