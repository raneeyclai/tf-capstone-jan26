terraform {
  backend "s3" {
    bucket  = "boa-tf-im-jan25-ranee"
    key     = "dev/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}