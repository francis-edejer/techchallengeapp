resource "aws_security_group" "default" {
  name        = "${var.project_name}-sg"
  description = "${var.project_name} security Group"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.listenport
    to_port         = var.listenport
    protocol        = "tcp"
    security_groups = [ var.allowed_sg ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
