/*
  DNS Records
*/

resource "aws_route53_zone" "aws_route53_zone" {
  name = "example.org"
  vpc_id = "${aws_vpc.default.id}"
}

resource "aws_route53_record" "aws_route53_record_elb" {
  zone_id = "${aws_route53_zone.aws_route53_zone.zone_id}"
  name = "elb.example.org"
  type = "CNAME"
  ttl = "300"
  records = ["${aws_elb.aws-elb.dns_name}"]
}

resource "aws_route53_record" "aws_route53_record_alb" {
  zone_id = "${aws_route53_zone.aws_route53_zone.zone_id}"
  name = "alb.example.org"
  type = "CNAME"
  ttl = "300"
  records = ["${aws_alb.aws-alb.dns_name}"]
}