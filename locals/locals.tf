locals {

   ami_id = data.aws_ami.joindevops.id
   instance_type = "t3.micro"
   common_name = "${var.project}-${var.environment}"
   ec2_tags_1 = merge(var.ec2-tags ,{
    name = "${local.common_name}-localdemo"
}
)
   }



