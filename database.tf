

resource "aws_db_instance" "education" {
  identifier             = var.instance_name
  name                    = var.database_name
  instance_class         = "db.t3.medium"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "13.1"
  username               = "postgres"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.education.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.education.name
  publicly_accessible    = true
  skip_final_snapshot    = true
  iam_database_authentication_enabled = true
  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"
  apply_immediately = true

  tags = {
    Owner       = "DevOps - Jerry L. Cutshaw",
    Environment = "demo - govcloud",
    Purpose     = "Nexus database backend",
    CreateDate  = timestamp(), 
    CreatedBy   = "Terraform"
  }
}
