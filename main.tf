provider "aws" {
   version = "~> 2.0"
   region  = "us-east-1"
}

resource "aws_instance" "dev" {
    ami = var.amis["us-east-1"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev"
    }
    vpc_security_group_ids = [aws_security_group.acesso-ssh.id]
}


resource "aws_s3_bucket" "test-bucket" {
    bucket = "imagens-s3"
    acl = "private"

    tags = {
        Name = "imagens-s3"
    }
}

resource "aws_dynamodb_table" "dynamodb-table-test" {
  name           = "TestTable"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "Title"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "Title"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}