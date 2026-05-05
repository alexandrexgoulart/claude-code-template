#!/bin/bash
# Setup automático de novos projetos com Claude Code

echo "=== Setup Automático de Novo Projeto Claude Code ==="

# Verificar se já existe .claude
if [ -d ".claude" ]; then
    echo "Diretório .claude já existe!"
    echo "Execute integrate-claude-template.sh para atualizar"
else
    echo "Nenhum .claude encontrado. O projeto precisa de configuração inicial."
    echo "Consulte claude-code-template.md para instruções"
fi

echo ""
echo "Estrutura esperada do .claude:"
echo "- 287 skills em .claude/skills/"
echo "- 61 agentes em .claude/agents/"
echo "- 25+ comandos em .claude/commands/"
echo "- 10+ regras em .claude/rules/"