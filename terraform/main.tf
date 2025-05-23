provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  skip_credentials_validation = true

  endpoints {
    ec2 = "http://ip10-0-2-6-cvh9tgab9qb14bivkplg-4566.direct.lab-boris.fr"
  }
}

variable "commit_sha" {
  description = "Git commit hash to generate unique AMI"
  type        = string
}

resource "aws_instance" "demo" {
  ami           = "ami-${var.commit_sha}"
  instance_type = "t2.micro"
}
