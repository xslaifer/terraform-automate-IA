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
      sudo yum update -y
      echo "Hola Johan!" > /var/www/html/index.html
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
