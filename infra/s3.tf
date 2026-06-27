###############################################
# S3 Bucket לארטיפקטים
###############################################

resource "aws_s3_bucket" "artifacts_bucket" {
  bucket = "jenkins-artifacts-${random_id.bucket_id.hex}"

  tags = {
    Name = "Jenkins Artifacts Bucket"
  }
}

###############################################
# יצירת מזהה רנדומלי כדי למנוע התנגשויות בשם
###############################################

resource "random_id" "bucket_id" {
  byte_length = 4
}

###############################################
# הפעלת גרסאות (Versioning)
###############################################

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.artifacts_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

###############################################
# הצפנת ברירת מחדל
###############################################

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.artifacts_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
