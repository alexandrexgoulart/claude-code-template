#!/bin/bash
# =============================================================================
# SISTEMA DE MEMÓRIA - Claude Code Template
# Gerenciador de memória para projetos
# =============================================================================

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Função de help
show_help() {
    echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}  GERENCIADOR DE MEMÓRIA - Claude Code Template${NC}"
    echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
    echo ""
    echo -e "${GREEN}Uso:${NC} memory-manager.sh [comando]"
    echo ""
    echo -e "${GREEN}Comandos:${NC}"
    echo "  --init        Inicializar memória para novo projeto"
    echo "  --update      Atualizar SESSION.md com contexto atual"
    echo "  --show        Mostrar conteúdo da memória atual"
    echo "  --backup      Criar backup da memória"
    echo "  --restore     Restaurar memória de backup"
    echo "  --help        Mostrar esta ajuda"
    echo ""
    echo -e "${GREEN}Exemplos:${NC}"
    echo "  ./memory-manager.sh --init"
    echo "  ./memory-manager.sh --update"
    echo "  ./memory-manager.sh --show"
    echo ""
}

# Função para inicializar memória
init_memory() {
    echo -e "${YELLOW}Inicializando memória do projeto...${NC}"

    if [ -f "SESSION.md" ]; then
        echo -e "${YELLOW}SESSION.md já existe!${NC}"
        echo -e "${YELLOW}Criando backup antes de continuar...${NC}"
        BACKUP_NAME="SESSION.backup.$(date +%Y%m%d_%H%M%S).md"
        cp SESSION.md "$BACKUP_NAME"
        echo -e "${GREEN}Backup criado: $BACKUP_NAME${NC}"
    else
        # Copiar template
        if [ -f ".claude/memory/templates/SESSION_TEMPLATE.md" ]; then
            cp .claude/memory/templates/SESSION_TEMPLATE.md SESSION.md
            echo -e "${GREEN}SESSION.md criado a partir do template!${NC}"
        else
            # Criar manualmente se não existir template
            cat > SESSION.md << 'EOF'
# Sessão de Trabalho - [Nome do Projeto]

**Última atualização:** [Data]
**Status:** [Em andamento / Concluído / Pausado]

---

## Ferramenta Usada

- **Ferramenta:** [OpenCode / Claude Code / Jan.ai]
- **Modelo:** [modelo usado]

---

## Como Usar Este Arquivo de Memória

**A cada nova sessão:**
1. O Claude/OpenCode deve ler automaticamente o CLAUDE.md
2. O CLAUDE.md contém instrução para ler este SESSION.md
3. Todo o contexto será carregado automaticamente

---

## Contexto do Projeto

### O que é
[Descrição breve do projeto]

### URLs
- **Local:** http://localhost:[porta]
- **Produção:** [URL se houver]

### Stack/Tecnologias
- **Frontend:** [ ]
- **Backend:** [ ]
- **Banco:** [ ]

---

## Estrutura de Arquivos

[Lista de arquivos principais]

---

## Funcionalidades Implementadas

[O que já foi feito]

---

## Problemas Conhecidos

[Issues abertos]

---

## Tarefas Próximas

[O que falta fazer]

---

## Observações Importantes

[Notas importantes]

---

*Este arquivo é atualizado automaticamente após cada sessão de trabalho.*
EOF
            echo -e "${GREEN}SESSION.md criado!${NC}"
        fi
    fi

    echo ""
    echo -e "${GREEN}✓ Memória inicializada com sucesso!${NC}"
    echo -e "${BLUE}Próximo passo: Inicie uma sessão com o Claude/OpenCode${NC}"
}

# Função para mostrar memória
show_memory() {
    if [ -f "SESSION.md" ]; then
        echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
        echo -e "${BLUE}  CONTEÚDO DA MEMÓRIA${NC}"
        echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
        echo ""
        cat SESSION.md
    else
        echo -e "${RED}✗ SESSION.md não encontrado!${NC}"
        echo -e "${YELLOW}Execute: memory-manager.sh --init${NC}"
    fi
}

# Função para atualizar memória
update_memory() {
    echo -e "${YELLOW}Atualizando memória...${NC}"
    echo ""
    echo -e "${BLUE}Para atualizar a memória, insira as informações solicitadas:${NC}"
    echo ""

    if [ -f "SESSION.md" ]; then
        echo -e "${GREEN}SESSION.md encontrado!${NC}"
        echo -e "${YELLOW}Atualize manualmente o arquivo com as informações da sessão atual.${NC}"
        echo ""
        echo -e "${GREEN}Campos sugeridos para atualização:${NC}"
        echo "  - Última atualização (data)"
        "  - Status do projeto"
        echo "  - Novas funcionalidades implementadas"
        echo "  - Problemas resolvidos"
        echo "  - Novas tarefas próximas"
    else
        echo -e "${RED}SESSION.md não encontrado!${NC}"
        echo -e "${YELLOW}Execute primeiro: memory-manager.sh --init${NC}"
    fi
}

# Função para criar backup
backup_memory() {
    if [ -f "SESSION.md" ]; then
        BACKUP_NAME="SESSION.backup.$(date +%Y%m%d_%H%M%S).md"
        cp SESSION.md "$BACKUP_NAME"
        echo -e "${GREEN}Backup criado: $BACKUP_NAME${NC}"
    else
        echo -e "${RED}✗ Nenhuma memória para fazer backup!${NC}"
    fi
}

# Função para restaurar backup
restore_memory() {
    LATEST_BACKUP=$(ls -t SESSION.backup.*.md 2>/dev/null | head -1)
    if [ -n "$LATEST_BACKUP" ]; then
        echo -e "${YELLOW}Último backup encontrado: $LATEST_BACKUP${NC}"
        echo -e "${YELLOW}Restaurando...${NC}"
        cp "$LATEST_BACKUP" SESSION.md
        echo -e "${GREEN}Memória restaurada!${NC}"
    else
        echo -e "${RED}✗ Nenhum backup encontrado!${NC}"
    fi
}

# =============================================================================
# MAIN
# =============================================================================

# Verificar argumentos
case "${1:-}" in
    --init)
        init_memory
        ;;
    --update)
        update_memory
        ;;
    --show)
        show_memory
        ;;
    --backup)
        backup_memory
        ;;
    --restore)
        restore_memory
        ;;
    --help|-h|"")
        show_help
        ;;
    *)
        echo -e "${RED}Comando desconhecido: $1${NC}"
        echo -e "${YELLOW}Execute: memory-manager.sh --help${NC}"
        exit 1
        ;;
esac

exit 0