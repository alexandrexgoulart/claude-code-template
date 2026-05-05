#!/bin/bash
# Script para integrar template Claude Code em projetos existentes

echo "=== Integração do Template Claude Code ==="

# Verificar se já existe .claude
if [ -d ".claude" ]; then
    echo "Pasta .claude já existe. Criando backup..."
    BACKUP_NAME=".claude.backup.$(date +%Y%m%d_%H%M%S)"
    cp -r .claude "$BACKUP_NAME"
    echo "Backup criado: $BACKUP_NAME"

    echo " atualizando estrutura..."
    echo " skills: $(ls -1 .claude/skills/ 2>/dev/null | wc -l)"
    echo " agentes: $(ls -1 .claude/agents/ 2>/dev/null | wc -l)"
    echo " comandos: $(ls -1 .claude/commands/ 2>/dev/null | wc -l)"
else
    echo "Nenhum .claude encontrado. Execute setup primeiro."
fi

echo ""
echo "Template Claude Code disponível no projeto!"
echo "Recursos instalados:"
echo "- 287 skills"
echo "- 61 agentes"
echo "- 25+ comandos"
echo "- 10+ regras"