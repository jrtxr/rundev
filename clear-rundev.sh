#!/bin/bash

rc_file="$HOME/.bashrc"
[ -n "$ZSH_VERSION" ] && rc_file="$HOME/.zshrc"

if [ ! -f "$rc_file" ]; then
  echo "Arquivo $rc_file não encontrado!"
  exit 1
fi

echo "Removendo função 'rundev' do $rc_file..."

sed -i '/rundev() {/,/}/d' "$rc_file"

if grep -q "rundev()" "$rc_file"; then
  echo "⚠️ Falha ao remover a função 'rundev'."
else
  echo "✅ Função 'rundev' removida com sucesso."
fi

echo "🔁 Para finalizar, execute: source $rc_file ou reinicie o terminal."
