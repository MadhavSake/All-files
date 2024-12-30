# Create a DB Subnet Group using the private subnets
resource "aws_db_subnet_group" "main" {
  name       = "rds-subnet-group-1"
  subnet_ids = [
    aws_subnet.private-ap-south-1a.id,
    aws_subnet.private-ap-south-1b.id
  ]

  tags = {
    Name = "rds-subnet-group-1"
  }
}

# Create an RDS PostgreSQL instance
resource "aws_db_instance" "postgres" {
  identifier           = "rds-postgres-instance"
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  db_name              = "appdb" # Use db_name instead of name
  username             = "dbadmin"
  password             = "SecurePass123"
  db_subnet_group_name = aws_db_subnet_group.main.name
  publicly_accessible  = false

  # Ensure a final snapshot is created before deletion
  skip_final_snapshot       = false
  final_snapshot_identifier = "final-snapshot-postgres"

  tags = {
    Name = "RDS PostgreSQL"
  }
}
