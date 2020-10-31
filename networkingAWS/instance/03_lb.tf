resource "aws_elb" "elb" {
  name               = "elb"
  security_groups = [aws_security_group.allow_lb.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  subnets = ["subnet-0ea1bee2895078b79"] #data.terraform_remote_state.vpc.outputs.public_1_subnet_id --> con remote_state
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 5
  }

  instances                   = [aws_instance.chris-app.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 10
  connection_draining         = true
  connection_draining_timeout = 10

  tags = {
    Name = "elb"
  }
}
