#!/bin/bash
# =============================================================================
# Script para integrar template Claude Code em projetos existentes
# =============================================================================

# Cores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo "════════════════════════════════════════════════════"
echo "  INTEGRAÇÃO DO TEMPLATE CLAUDE CODE"
echo "════════════════════════════════════════════════════"
echo ""

# Verificar argumento
MEMORY_OPTION=""
if [ "$1" = "--with-memory" ] || [ "$1" = "-m" ]; then
    MEMORY_OPTION="true"
    echo -e "${BLUE}Modo: COM sistema de memória${NC}"
else
    echo -e "${YELLOW}Modo: Padrão (sem memória automática)${NC}"
    echo -e "${YELLOW}Use --with-memory ou -m para incluir sistema de memória${NC}"
fi

echo ""

# Verificar se já existe .claude
if [ -d ".claude" ]; then
    echo -e "${YELLOW}Pasta .claude já existe. Criando backup...${NC}"
    BACKUP_NAME=".claude.backup.$(date +%Y%m%d_%H%M%S)"
    cp -r .claude "$BACKUP_NAME"
    echo -e "${GREEN}✓ Backup criado: $BACKUP_NAME${NC}"

    echo ""
    echo " atualizando estrutura..."
    echo "   skills: $(ls -1 .claude/skills/ 2>/dev/null | wc -l)"
    echo "   agentes: $(ls -1 .claude/agents/ 2>/dev/null | wc -l)"
    echo "   comandos: $(ls -1 .claude/commands/ 2>/dev/null | wc -l)"
    echo "   regras: $(ls -1 .claude/rules/ 2>/dev/null | wc -l)"
else
    echo -e "${YELLOW}Nenhum .claude encontrado. Execute setup primeiro.${NC}"
fi

# Criar SESSION.md se opção de memória estiver ativa
if [ "$MEMORY_OPTION" = "true" ]; then
    echo ""
    echo "============================================"
    echo "  CONFIGURANDO SISTEMA DE MEMÓRIA"
    echo "============================================"
    echo ""

    if [ -f "SESSION.md" ]; then
        echo -e "${YELLOW}SESSION.md já existe! Criando backup...${NC}"
        BACKUP_SESSION="SESSION.backup.$(date +%Y%m%d_%H%M%S).md"
        cp SESSION.md "$BACKUP_SESSION"
        echo -e "${GREEN}✓ Backup criado: $BACKUP_SESSION${NC}"
    else
        if [ -f ".claude/memory/templates/SESSION_TEMPLATE.md" ]; then
            cp .claude/memory/templates/SESSION_TEMPLATE.md SESSION.md
            echo -e "${GREEN}✓ SESSION.md criado a partir do template!${NC}"
        else
            echo -e "${YELLOW}Template não encontrado. PULANDO criação de memória.${NC}"
        fi
    fi
fi

echo ""
echo "════════════════════════════════════════════════════"
echo -e "${GREEN}  TEMPLATE CLAUDE CODE DISPONÍVEL NO PROJETO!${NC}"
echo "════════════════════════════════════════════════════"
echo ""
echo "Recursos instalados:"
echo "  - 287 skills"
echo "  - 61 agentes"
echo "  - 25+ comandos"
echo "  - 10+ regras"

if [ "$MEMORY_OPTION" = "true" ]; then
    echo "  - Sistema de memória (SESSION.md)"
    echo ""
    echo "════════════════════════════════════════════════════"
    echo -e "${GREEN}  PRÓXIMO PASSO:${NC}"
    echo "════════════════════════════════════════════════════"
    echo "  Inicie uma sessão com o Claude/OpenCode"
    echo "  O SESSION.md será preenchido automaticamente"
fi

echo ""