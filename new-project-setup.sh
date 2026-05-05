#!/bin/bash
# Setup automático de novos projetos com Claude Code

echo "=== Setup Automático de Novo Projeto Claude Code ==="

# Verificar se já existe .claude
if [ ! -d ".claude" ]; then
    echo "Copiando estrutura do template..."
    cp -r template/.claude .claude
    echo "Template Claude Code configurado com sucesso!"
else
    echo "Diretório .claude já existe, atualizando memória..."
fi
