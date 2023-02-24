resource "aws_eip" "qwikapp_eip" {
  tags     = var.aws_eip_tags
  instance = var.instance_id
  vpc      = var.vpc
}