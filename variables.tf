variable "region" {
  default = "us-gov-east-1"
}

variable "db_password" {
  description = "RDS root user password"
  sensitive   = true
}


variable "database_name" {
  description = "Name of the user database to be created"
  default = "tftestdb"  
}

variable "instance_name" {
  description = "Input Instance Name"
  default = "education"
}
