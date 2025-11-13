variable "project" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Entorno (dev, staging, prod)"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block de la VPC"
  type        = string
}
