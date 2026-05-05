#!/bin/bash
# Setup Claude Code Template

echo "=== Claude Code Template Setup ==="

# Copiar a estrutura do template para o projeto atual
if [ ! -d ".claude" ]; then
    echo "Copiando estrutura do template..."
    cp -r .claude .claude/
    echo "Template Claude Code configurado com sucesso!"
else
    echo "Diretório .claude já existe, pulando cópia"
fi
