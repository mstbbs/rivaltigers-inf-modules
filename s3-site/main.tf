
// naked bucket
resource "aws_s3_bucket" "blog" {
  bucket = "${var.bucket_name}"
  region = "us-west-2"
  acl = "public-read"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "AddPerm",
    "Effect": "Allow",
    "Principal": "*",
    "Action": "s3:GetObject",
    "Resource": "arn:aws:s3:::${var.bucket_name}/*"
  }]
}
EOF

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

// www bucket
resource "aws_s3_bucket" "wwwblog" {
  bucket = "www.${var.bucket_name}"
  region = "us-west-2"
  acl = "public-read"
  website {
    redirect_all_requests_to = "${var.bucket_name}"
  }
}
