resource "aws_s3_bucket" "not-here" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
    Env  = var.env
  }
}


resource "aws_s3_object" "not-here" {
  bucket       = aws_s3_bucket.not-here.id
  key          = var.file_key
  source       = var.file_path
  etag         = filemd5(var.file_path)
  content_type = "text/html"

  depends_on = [aws_s3_bucket.not-here]
}
