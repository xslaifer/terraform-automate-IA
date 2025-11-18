#!/usr/bin/env bash

# ================================
#  Terraform Runner PRO by You 😎
# ================================

COMMAND=$1
LOG_DIR="logs"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="$LOG_DIR/terraform_$COMMAND_$TIMESTAMP.log"

# Colores
GREEN="\e[32m"
RED="\e[31m"
BLUE="\e[34m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"

# Crear carpeta logs si no existe
mkdir -p $LOG_DIR

if [[ -z "$COMMAND" ]]; then
  echo -e "${RED}❌ Debes usar: ./tf.sh [plan|apply|destroy]${ENDCOLOR}"
  exit 1
fi

echo -e "${BLUE}🔧 Ejecutando: terraform $COMMAND ...${ENDCOLOR}"
echo -e "${YELLOW}📄 Guardando logs en: $LOG_FILE${ENDCOLOR}"

start=$(date +%s)

case $COMMAND in

  plan)
    terraform init | tee -a "$LOG_FILE"
    terraform plan | tee -a "$LOG_FILE"
    ;;

  apply)
    terraform init | tee -a "$LOG_FILE"
    terraform apply -auto-approve | tee -a "$LOG_FILE"
    echo -e "${GREEN}🔎 Mostrando outputs:${ENDCOLOR}"
    terraform output | tee -a "$LOG_FILE"
    ;;

  destroy)
    terraform destroy -auto-approve | tee -a "$LOG_FILE"
    ;;

  *)
    echo -e "${RED}❌ Comando inválido. Usa: plan | apply | destroy${ENDCOLOR}"
    exit 1
    ;;
esac

end=$(date +%s)
runtime=$((end - start))

echo -e "${GREEN}⏱️ Tiempo total del comando (${COMMAND}): ${runtime} segundos${ENDCOLOR}"
echo -e "${BLUE}📘 Log completo guardado en: ${LOG_FILE}${ENDCOLOR}"

