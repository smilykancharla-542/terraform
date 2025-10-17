variable  "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable  "instance_type" {
    type = string
    default = "t3.micro"
}

variable "ec2-tags" {
     type = map
      default = {
        Name = "terraform"
        Terraform = "true"
    }
}

variable "cidir" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "protocol" {
    type = string
    default = "-1"
}

variable "sg_id" {
    type = string
    default = "all_allow"
}