resource "aws_instance" "terraform" {

  ami = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.all_allow .id]
  tags = {
        Name = "terraform"
        Terraform = "true"
    }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"
    on_failure = continue  ##if provisioner is failed ec2 will create
    
  }
  provisioner "local-exec" {
    command = "echo ec2 is destroyed"
    when =destroy
    
  }

  connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = self.public_ip
    }
  provisioner "remote-exec" {
      inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
      ]
}
}
resource "aws_security_group" "all_allow" {
  name   = "all_allow1"
  
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
    name = "all_allow1"
  }

}