module "rds" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "dev-app-db-build"

  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  db_name           = "appdb"
  username          = "rdadmin"
  password          = var.db_password
  port              = 3306

  iam_database_authentication_enabled = false
  skip_final_snapshot                 = true

  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  create_monitoring_role = true
  monitoring_interval    = 30
  monitoring_role_name   = "rakeem-admin-rds-monitoring"

  create_db_subnet_group = true
  subnet_ids             = module.vpc.private_subnets

  family               = "mysql5.7"
  major_engine_version = "5.7"

  deletion_protection = false

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

  tags = {
    Owner       = "rakeem-admin"
    Environment = "dev"
  }
}