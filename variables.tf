##Local Values
locals {
  aws_region = "us-east-1"
  # aws_account_id = "012345678901"
  prefix = "staging-qwikapp"
  common_tags = {
    Env           = "staging"
    Project       = local.prefix
    ManagedBy     = "Terraform"
    ProvisionedBy = "Terraform"
    Owner         = "viransonland@gmail.com"
  }
}

#Variables values defined in terraform.tfvars file
##---------CRDS----------
variable "region" {
  type        = string
  description = "AWS Region to provision resources"
}

variable "access_key" {
  type        = string
  description = "AWS Access Key"
}

variable "secret_key" {
  type        = string
  description = "AWS Secret Key"
}
##---------CRDS----------

variable "vpc_id" {
  type = string
}
variable "public_subnet_id" {
  type = string
}

variable "vpc_sg_profile" {
  # type        = map(any)
  description = "AWS VPC Security Group resources variables"
}

variable "ec2_instance_profile" {
  # type        = map(any)
  description = "AWS EC2 Instance Resource variables"
}

variable "vpc_staging_eip_profile" {
  # type        = map(any)
  description = "AWS EIP variables"
}