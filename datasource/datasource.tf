# data "aws_instance" "terraform" {
#   instance_id = "i-062547d25434d6973"

#   }

#   output "output_instances" {
#      value=data.aws_instance.terraform.security_groups
#   }

data "aws_ami" "joindevops" {
    owners           = ["973714476881"]
    most_recent      = true
    
    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}
