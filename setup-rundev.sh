#!/bin/bash

script_name="$1"
alias_name="$2"

BASE_PATH=\$HOME/Documentos/git/rundev

if [ -z "$script_name" ] || [ -z "$alias_name" ]; then
  echo "Uso: ./setup-rundev.sh <nome-do-script> <apelido>"
  exit 1
fi

rc_file="$HOME/.bashrc"
[ -n "$ZSH_VERSION" ] && rc_file="$HOME/.zshrc"

echo "Adicionando função ao $rc_file..."

cat <<EOF >> "$rc_file"

rundev() {
  case "\$1" in
    $alias_name)
      bash "$BASE_PATH/$script_name" "$alias_name"
      ;;
    *)
      echo "Projeto '\$1' não reconhecido."
      ;;
  esac
}
EOF

echo "Função 'rundev' atualizada. Rode: source $rc_file ou reinicie o terminal."

