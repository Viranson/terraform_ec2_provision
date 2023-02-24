output "aws_eip_id" {
  value = aws_eip.qwikapp_eip.id
}

output "aws_eip_dns" {
  value = aws_eip.qwikapp_eip.public_dns
}