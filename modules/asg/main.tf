# LAUNCH TEMPLATE
resource "aws_launch_template" "this" {
  name_prefix = "${var.project}-lt"

  image_id      = var.ami_id
  instance_type = var.instance_type

  iam_instance_profile {
    name = var.instance_profile
  }

  network_interfaces {
    security_groups = [var.instance_sg_id]
  }

  user_data = base64encode(
    <<-EOF
    #!/bin/bash
    set -e

    # Actualizar paquetes
    yum update -y

    # Instalar Apache (httpd)
    yum install -y httpd

    # Habilitar Apache para que arranque siempre
    systemctl enable httpd

    # Iniciar Apache
    systemctl start httpd

    # Crear página simple
    echo "Hola Esta es tu Pagina Creada con Terraform, con ALB y ASG!" > /var/www/html/index.html

  EOF
)

}

# AUTO SCALING GROUP
resource "aws_autoscaling_group" "this" {
  name                      = "${var.project}-asg"
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 1
  vpc_zone_identifier       = var.private_subnet_ids
  health_check_type         = "EC2"

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]
}
