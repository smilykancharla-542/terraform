variable  "instances" {
     default = ["mongodb","redis","frontend","user"]
}

variable "domain" {
     type = string
     default = "saws86s.fun"
}