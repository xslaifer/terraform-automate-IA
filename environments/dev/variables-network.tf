variable "vpc_cidr_block" {
  description = "Bloque CIDR para la VPC principal"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "public2_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}


variable "private_subnet_cidr" {
  type    = string
  default = "10.0.3.0/24"
}

variable "az_a" {
  type    = string
  default = "us-east-1a"
}

variable "az_b" {
  type    = string
  default = "us-east-1b"
}