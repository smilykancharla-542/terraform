resource "aws_route53_record" "route" {

  allow_overwrite = true  ### if record already present it will update the record
  count = 4
  zone_id = "Z01261487TFX8V684K99"
  name    = "${var.instances[count.index]}.${var.domain}"  #mongodb.saws86s.fun
  type    = "A"
  ttl     = 1
  records = [aws_instance.terraform[count.index].private_ip]
}