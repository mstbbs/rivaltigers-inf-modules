output "s3-endpoint" {
  value = "${aws_s3_bucket.blog.website_endpoint}"
}