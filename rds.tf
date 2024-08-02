resource "aws_db_instance" "wordpress" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name              = "wordpress"
  identifier           = "wordpress"
  username             = "admin"
  password             = "rdspassword"
  parameter_group_name = "default.mysql8.0"
  publicly_accessible  = true
  skip_final_snapshot  = true
  # vpc_security_group_ids = [module.eks.cluster_primary_security_group_id]
  vpc_security_group_ids = [
    aws_security_group.wp-db-sg.id,
    module.eks.cluster_primary_security_group_id
  ]
  db_subnet_group_name = aws_db_subnet_group.wordpress.name
}

resource "aws_db_subnet_group" "wordpress" {
  name       = "wordpress"
  subnet_ids = module.vpc.private_subnets
}