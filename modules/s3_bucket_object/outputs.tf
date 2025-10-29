output "bucket_name" {
  value = aws_s3_bucket.not-here.bucket
}

output "object_url" {
  value = "https://${aws_s3_bucket.not-here.bucket}.s3.${var.region}.amazonaws.com/${aws_s3_object.not-here.key}"
}
