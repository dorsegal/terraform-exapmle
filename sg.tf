/*
  SG
*/
resource "aws_security_group" "aws_sg" {
    name = "aws_sg"
    description = "Allow incoming HTTP/HTTPS connections."

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "aws_sg"
    }
}