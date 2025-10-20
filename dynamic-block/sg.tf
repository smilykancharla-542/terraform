resource "aws_security_group" "roboshop" {
  name   = "roboshop-strict-sg"
  
  egress {
    from_port       = 0  #from 0 to 0 is opening all ports
    to_port         = 0
    protocol        = "-1"  # allowing all protocals
    cidr_blocks      = ["0.0.0.0/0"] #internet
  }

  dynamic "ingress" {
    for_each = toset(var.ingress_ports)
    content {
    from_port       = ingress.value  #from 0 to 0 is opening all ports
    to_port         = ingress.value
    protocol        = "tcp"  # allowing all protocals
    cidr_blocks      = ["0.0.0.0/0"]
  }
      
    }
   
  

  tags = {
    name = "roboshop-strict-sg"
  }

}