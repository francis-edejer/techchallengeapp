resource "aws_security_group" "db" {
  name        = "${var.project_name}-db-sg"
  description = "${var.project_name} db security Group"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [ var.aws_security_group.default.id ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
