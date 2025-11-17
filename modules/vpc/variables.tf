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

variable "public_subnet_cidr" {
  type    = string

}
variable "public2_subnet_cidr" {
  type    = string

}

variable "private_subnet_cidr" {
  type    = string

}

variable "az_a" {
  type    = string

}

variable "az_b" {
  type    = string

}