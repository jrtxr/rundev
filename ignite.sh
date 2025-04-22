#!/bin/bash

TARGET_DIR_NAME="$1"
BASE_PATH="$2"
shift 2
COMMANDS=("$@")

cd "$BASE_PATH" || { echo "Diretório $BASE_PATH não encontrado!"; exit 1; }

find . -type d -name "$TARGET_DIR_NAME" | while read -r dir; do
    echo "--------------------------------------"
    echo "Entrando no diretório: $dir"
    echo "--------------------------------------"
    cd "$dir" || { echo "Erro ao entrar no diretório $dir"; continue; }

    for cmd in "${COMMANDS[@]}"; do
        echo "-> Executando: $cmd"
        eval "$cmd"
    done

    break
done

