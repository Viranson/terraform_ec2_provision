# region     = "us-east-1"
# ami = "ami-06178cf087598769c"
access_key       = ""
secret_key       = ""
region           = "eu-west-3"
ami              = "ami-0dfb6769e523bf035"
instance_type    = "t2_micro"
vpc-id           = ""
public_subnet_id = ""

vpc_sg_profile = {
  staging-qwikapp-vpc-sg = {
    vpc_sg_name = "staging_qwikapp_sg"
    description = "Allow HTTP & HTTPS"
    ingress_rules = {
      allow_http_from_anywhere = {
        description      = "Allow HTTP"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
      }
      allow_https_from_anywhere = {
        description      = "Allow HTTPS"
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
      }
    }
    egress_rules = {
      allow_all_from_anywhere = {
        description      = "Allow All"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
      }
    }
    tags = {
      Name = "staging-qwikapp-sg"
    }
  }
}

ec2_instance_profile = {
  staging-ec2-qwikapp-host = {
    instance_type = "t2.micro"
    key_name      = "staging-qwikapp-host-key"
    subnet_name   = "public-us-east-1a"
    vpc_sg_name   = "staging-qwikapp-vpc-sg"
    tags = {
      Name = "staging-ec2-qwikapp-host"
    }
  }
}

vpc_staging_eip_profile = {
  staging-vpc01-natgw_eip_01 = {
    vpc_name      = "staging-vpc01"
    instance_name = "staging-ec2-qwikapp-host"
    vpc           = true
    tags = {
      Name = "staging-qwikapp-instance-eip"
    }
  }
}