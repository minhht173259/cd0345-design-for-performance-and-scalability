# TODO: Designate a cloud provider, region, and credentials
terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
    region                   = "us-east-1"
    shared_credentials_files = ["~/.aws/credentials"]
    profile                  = "terraform"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "micro_instance_1" {
    ami = "ami-0182f373e66f89c85"  ## Amazon Linux 2023 AMI
    instance_type = "t2.micro"
    subnet_id = "subnet-095272e5b24d0719c"
    tags = {
        Name = "Udacity T2"
        Project = "Project3"
    }
}
resource "aws_instance" "micro_instance_2" {
    ami = "ami-0182f373e66f89c85"  ## Amazon Linux 2023 AMI
    instance_type = "t2.micro"
    subnet_id = "subnet-095272e5b24d0719c"
    tags = {
        Name = "Udacity T2"
        Project = "Project3"
    }
}
resource "aws_instance" "micro_instance_3" {
    ami = "ami-0182f373e66f89c85"  ## Amazon Linux 2023 AMI
    instance_type = "t2.micro"
    subnet_id = "subnet-095272e5b24d0719c"
    tags = {
        Name = "Udacity T2"
        Project = "Project3"
    }
}
resource "aws_instance" "micro_instance_4" {
    ami = "ami-0182f373e66f89c85"  ## Amazon Linux 2023 AMI
    instance_type = "t2.micro"
    subnet_id = "subnet-095272e5b24d0719c"
    tags = {
        Name = "Udacity T2"
        Project = "Project3"
    }
}


# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "large_instance_1" {
    ami = "ami-0182f373e66f89c85"  ## Amazon Linux 2023 AMI
    instance_type = "m4.large"
    subnet_id = "subnet-095272e5b24d0719c"
    tags = {
        Name = "Udacity M4"
        Project = "Project3"
    }
}
resource "aws_instance" "large_instance_2" {
    ami = "ami-0182f373e66f89c85"  ## Amazon Linux 2023 AMI
    instance_type = "m4.large"
    subnet_id = "subnet-095272e5b24d0719c"
    tags = {
        Name = "Udacity M4"
        Project = "Project3"
    }
}