output "app_public_ip"{
  value = aws_instance.chris-app.public_ip
}

output "app_private_ip"{
  value = aws_instance.chris-app.private_ip
}

output "ssh_connection_string"{
  value = "ssh -l ubuntu -A ${aws_instance.chris-app.public_ip}"
}

output "lb_dns_name"{
  value = aws_elb.elb.dns_name
}
