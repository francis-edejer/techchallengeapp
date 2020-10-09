resource "aws_db_instance" "default" {
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "postgres"
  engine_version          =  var.postgres_engine_version
  instance_class          = "db.t2.micro"
  name                    = "${var.project_name}-db"
  username                = "postgres"
  password                = data.vault_generic_secret.db.data["password"]
  vpc_security_group_ids  = [ aws_security_group.db.id ]
}