variable "project" {}
variable "instance_profile" {}
variable "instance_sg_id" {}
variable "target_group_arn" {}
variable "private_subnet_ids" {
  type = list(string)
}
variable "ami_id" {}
variable "instance_type" {
  default = "t3.micro"
}
