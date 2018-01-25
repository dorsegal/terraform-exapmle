/*
  ELB
*/

resource "aws_elb" "aws-elb" {
  name = "aws-elb"
  subnets = [
    "${aws_subnet.eu-west-1a-public.id}",
    "${aws_subnet.eu-west-1b-public.id}"]
  security_groups = [
    "${aws_security_group.aws_sg.id}"]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 443
    lb_protocol = "https"
    ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }
}