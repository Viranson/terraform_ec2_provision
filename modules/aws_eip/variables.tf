variable "aws_eip_tags" {
  type        = map(any)
  description = "AWS EIP Resource Tags"
}

variable "instance_id" {
  type        = string
  description = "AWS EC2 instance associated"
  default     = ""
}

variable "vpc" {
  type        = bool
  default     = "true"
  description = "Boolean if the EIP is in a VPC or not"
}