resource "aws_instance" "terraform" {

  ami = local.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.all_allow .id]
  tags = local.ec2_tags_1
}

resource "aws_security_group" "all_allow" {
  name   = var.sg_id
  
  egress {
    from_port       = 0  #from 0 to 0 is opening all ports
    to_port         = 0
    protocol        = var.protocol  # allowing all protocals
    cidr_blocks      = var.cidir #internet
  }

  ingress {
    from_port       = 0  #from 0 to 0 is opening all ports
    to_port         = 0
    protocol        = var.protocol # allowing all protocals
    cidr_blocks      = var.cidir
  }

  tags = {
    name = "all_allow"
  }

}