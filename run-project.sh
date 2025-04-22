#!/bin/bash

TARGET_DIR_NAME="$1"
COMMANDS="$2"
BASE_PATH="$HOME"  

PROJECT_PATH=$(find "$BASE_PATH" -type d \( -name "Documentos" -o -name "Documents" \) -exec find {} -type d -name "$TARGET_DIR_NAME" \; | head -n 1)

if [ -z "$PROJECT_PATH" ]; then
  echo "Diretório '$TARGET_DIR_NAME' não encontrado em '$BASE_PATH/Documentos' ou '$BASE_PATH/Documents'!"
  exit 1
fi

echo "Indo para $PROJECT_PATH"
cd "$PROJECT_PATH" || exit

IFS=';' read -ra CMD_ARRAY <<< "$COMMANDS"

for cmd in "${CMD_ARRAY[@]}"; do
  echo "Executando: $cmd"
  eval "$cmd"
done
