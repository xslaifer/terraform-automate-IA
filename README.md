Agente IA para recomendaciones y analisis del codigo en terraform


## 🧱 Componentes Implementados

📦 Infraestructura (IaC con Terraform)

├── 🔐 IAM Role

└──── Permite comunicación segura con AWS SSM

├── 🌐 Red (VPC)

├────── VPC principal

├────── Subred privada

├────── 2 subredes públicas

├────── 🌉 NAT Gateway (salida a internet de subred privada)

└────── 🌍 Internet Gateway (salida a internet de subredes públicas)

├── 🛡️ Security Groups

├────── SG del ALB → permite tráfico entrante por el puerto 80

└────── SG de instancias → solo permite tráfico desde el ALB por el puerto 80

├── ⚖️ Application Load Balancer (ALB)

└────── Distribuye tráfico entre múltiples instancias

├── 🎯 Target Group

└────── Registra las instancias del ASG

├── 📈 Auto Scaling Group (ASG)

└────── Escala automáticamente las instancias según demanda

                                                ARQUITECTURA CREADA

<img width="598" height="572" alt="image" src="https://github.com/user-attachments/assets/7352424c-0762-4914-826f-65681c53f85f" />


