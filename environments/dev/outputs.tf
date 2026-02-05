output "vpc_id" {
  value = module.vpc.vpc_id
}

output "alb_arn" {
  value = module.alb.target_group_arn
}

output "alb_dns_name" {
  description = "URL del Load Balancer lista para abrir en el navegador"
  value       = "http://${module.alb.alb_dns}"
}

