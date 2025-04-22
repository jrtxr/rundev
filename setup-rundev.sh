#!/bin/bash

PROJECTS_FILE="projects.txt"
RC_FILE="$HOME/.bashrc"
[ -n "$ZSH_VERSION" ] && RC_FILE="$HOME/.zshrc"
BASE_PATH="$HOME/Documentos/git"

if [ ! -f "$PROJECTS_FILE" ]; then
  echo "Arquivo $PROJECTS_FILE não encontrado!"
  exit 1
fi

echo "Adicionando função 'rundev' ao $RC_FILE..."

cat <<'EOF' >> "$RC_FILE"

rundev() {
  case "$1" in
EOF

while IFS= read -r line; do
  if [[ -z "$line" || "$line" =~ ^# ]]; then
    continue
  fi

  if [[ "$line" =~ ^alias_name=(.*) ]]; then
    alias_name="${BASH_REMATCH[1]}"
  elif [[ "$line" =~ ^target_dir_name=(.*) ]]; then
    target_dir="${BASH_REMATCH[1]}"
  elif [[ "$line" =~ ^commands=(.*) ]]; then
    commands="${BASH_REMATCH[1]}"
    
    if [ -z "$alias_name" ] || [ -z "$target_dir" ] || [ -z "$commands" ]; then
      echo "❌ Linha inválida detectada. Ignorando."
      continue
    fi

    PROJECT_SCRIPT=$(find "$HOME" -type f -name "run-project.sh" -path "$HOME/Documentos/*" -o -path "$HOME/Documents/*" | head -n 1)

    if [ -z "$PROJECT_SCRIPT" ]; then
      echo "❌ Arquivo 'run-project.sh' não encontrado em Documentos ou Documents!"
      continue
    fi

    cat <<EOF >> "$RC_FILE"
    $alias_name)
      bash "$PROJECT_SCRIPT" "$target_dir" "$commands"
      ;;
EOF

    echo "✅ Alias '$alias_name' adicionado."

    alias_name=""
    target_dir=""
    commands=""
  fi
done < "$PROJECTS_FILE"

cat <<'EOF' >> "$RC_FILE"
    *)
      echo "Projeto '$1' não reconhecido."
      ;;
  esac
}
EOF

echo "Função 'rundev' adicionada com sucesso."
