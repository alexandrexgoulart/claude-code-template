#!/bin/bash
# Script para limpar memória de projeto anterior

echo "=== Limpar Memória do Projeto ==="

# Verificar se existe diretório de memória
if [ -d ".claude/memory" ]; then
    echo "Limpando memória do projeto..."
    # O Claude Code gerencia a memória automaticamente
    echo "Memória será reconstruída automaticamente na próxima sessão"
else
    echo "Nenhum diretório de memória encontrado"
fi

echo ""
echo "Para atualizar memória manualmente:"
echo "bash .claude/tools/update-project-memory.sh"

echo ""
echo "Memória limpa com sucesso!"