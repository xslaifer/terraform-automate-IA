variable "project" {
  description = "Nombre del proyecto"
  type        = string
  default     = "terraform-lab"
}

variable "environment" {
  description = "Entorno (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "Región de AWS"
  type        = string
  default     = "us-east-1"
}


variable "aws_profile" {
  description = "Perfil de AWS CLI a usar"
  type        = string
  default     = "default"
}


variable "ami_id" {
  default = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
}