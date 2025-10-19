resource "aws_instance" "terraform" {
  for_each = toset(var.instances)
  ami = "ami-09c813fb71547fc4f"
  
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.all_allow .id]
  tags = {
        Name = each.value
        Terraform = "true"
    }
}

resource "aws_security_group" "all_allow" {
  name   = "all_allow"
  
  egress {
    from_port       = 0  #from 0 to 0 is opening all ports
    to_port         = 0
    protocol        = "-1"  # allowing all protocals
    cidr_blocks      = ["0.0.0.0/0"] #internet
  }

  ingress {
    from_port       = 0  #from 0 to 0 is opening all ports
    to_port         = 0
    protocol        = "-1"  # allowing all protocals
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    name = "all_allow"
  }
}