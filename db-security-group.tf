resource "aws_security_group" "wp-db-sg" {
  name        = "wp-db-sg"
  description = "Outgoing MySQL connections"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow traffic from within the VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

  tags = {
    Name = "wp-db-sg"
  }
}
