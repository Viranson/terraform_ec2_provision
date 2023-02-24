data "aws_vpc" "prod_vpc" {
  id = var.vpc_id
}

data "aws_subnet" "prod_public_subnet" {
  id = var.public_subnet_id
}

module "staging_security_group" {
  source        = "./modules/aws_security_group"
  for_each      = var.vpc_sg_profile
  vpc_id        = module.data.aws_vpc.prod_vpc.id
  vpc_sg_name   = each.value.vpc_sg_name
  description   = each.value.description
  ingress_rules = each.value.ingress_rules
  egress_rules  = each.value.egress_rules
  vpc_sg_tags = merge(
    local.common_tags, each.value.tags
  )
}

module "staging_instance" {
  source                    = "./modules/aws_instance"
  for_each                  = var.ec2_instance_profile
  ec2_ami                   = var.ami
  user_data                 = file("./setup.sh")
  instance_type             = each.value.instance_type
  iam_instance_profile_name = module.aws_iam_bastion_host_profile.bastion_iam_instance_profile_name
  key_name                  = each.value.key_name
  subnet_id                 = data.aws_subnet.prod_public_subnet.id
  security_group_ids        = ["${module.staging_security_group[each.value.vpc_sg_name].vpc_sg_id}"]
  qwikapp_ec2_instance_tags = merge(
    local.common_tags, each.value.tags
  )
}

module "staging_eip" {
  source      = "./modules/aws_eip"
  for_each    = var.vpc_staging_eip_profile
  instance_id = module.staging_instance[each.value.instance_name].qwikapp_ec2_instance_id
  vpc         = each.value.vpc
  aws_eip_tags = merge(
    local.common_tags, each.value.tags
  )
}