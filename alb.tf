/**
 * ALB
 */
resource "aws_alb" "aws-alb" {
  name            = "aws-alb"
  internal        = false
  security_groups = ["${aws_security_group.aws_sg.id}"]
  subnets         = ["${aws_subnet.eu-west-1a-public.id}", "${aws_subnet.eu-west-1b-public.id}"]
  enable_deletion_protection = false
}

/**
 * Target group for ALB
 */
resource "aws_alb_target_group" "web" {
  name     = "$aws_tg_web"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.default.id}"

  stickiness {
    type = "lb_cookie"
  }

  health_check {
    path = "/"
  }
}

/**
 * HTTP Lister for ALB
 */
resource "aws_alb_listener" "front_80" {
  load_balancer_arn = "${aws_alb.aws-alb.arn}"
  port = "80"
  protocol = "HTTP"
  default_action {
    target_group_arn = "${aws_alb_target_group.web.arn}"
    type = "forward"
  }
}