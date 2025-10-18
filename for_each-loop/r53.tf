resource "aws_route53_record" "route" {
  for_each = aws_instance.terraform

  allow_overwrite = true  ### if record already present it will update the record
  zone_id = "Z01261487TFX8V684K99"
  name    = each.key  #mongodb.saws86s.fun
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
}