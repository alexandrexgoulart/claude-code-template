#!/bin/bash
# Script para integrar template Claude Code em projetos existentes

echo "=== Integração do Template Claude Code ==="

# Verificar se já existe .claude
if [ -d ".claude" ]; then
    echo "Pasta .claude já existe. Criando backup..."
    cp -r .claude .claude.backup.$(date +%Y%m%d_%H%M%S)
    echo "Backup criado: .claude.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Mesclar conteúdo do template
    echo "Mesclando conteúdo do template..."
    cp -r /caminho/do/template/NOVA\ PASTA/.claude/* .claude/
else
    echo "Copiando template Claude Code..."
    cp -r /caminho/do/template/NOVA\ PASTA/.claude ./
fi

echo "Integração concluída! Claude Code disponível no projeto."
echo "Para usar: claude-code"
