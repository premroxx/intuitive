# CREATE AN S3 BUCKET 
 resource "aws_s3_bucket" "bucket" {
   bucket = var.bucket_name
   force_destroy = true
 }
