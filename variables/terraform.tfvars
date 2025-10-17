ami_id =  "ami-09c813fb71547fc4f"
# instance_type = "t3.small"
ec2-tags = {
        Name = "terraform"
        Terraform = "true"
    }
cidir = ["0.0.0.0/0"]

protocol =  "-1"
sg_id = "all_allow"

