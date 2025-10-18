variable  "instances" {
   #  default = ["mongodb","redis","frontend","user"] ## for list we can use count based loop
   default = {
       mongodb = "t3.micro"
       redis = "t3.micro"
       mysql = "t3.small"
   }
}

variable "domain" {
     type = string
     default = "saws86s.fun"
}