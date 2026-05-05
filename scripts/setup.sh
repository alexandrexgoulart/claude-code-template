#!/bin/bash
# Setup Claude Code Template

echo "=== Claude Code Template Setup ==="

# Verificar se já existe .claude
if [ -d ".claude" ]; then
    echo "Diretório .claude já existe."
    echo "Para integrar, use: bash integrate-claude-template.sh"
else
    echo "Nenhum diretório .claude encontrado."
    echo "Clone o template ou crie manualmente."
fi

echo "Para mais informações, consulte: claude-code-template.md"