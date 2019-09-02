
output "ip_public_web" {
  value = "${aws_eip.web-1.public_ip}"
}
