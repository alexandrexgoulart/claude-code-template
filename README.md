# Claude Code Template - Guia Completo de Uso

## Visão Geral

Este template completo do Claude Code já está configurado com **229 skills** e **92 agentes** pré-configurados para uso imediato.

## Como Usar em Projetos Existentes

### Para projetos SEM pasta .claude existente:

1. **Exemplo com o projeto Isabella Siqueira Advocacia:**
```bash
# Navegar até o diretório do projeto
cd "/c/Users/Alexandre/OneDrive/((((IMPORTANTE))))/Clientes VirtuAi 2.0/Opencode_Teste/isabella-siqueira-advocacia"

# Copiar o template completo do GitHub
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template
cp -r temp-template/template/.claude .claude/
rm -rf temp-template
```

### Para projetos COM pasta .claude existente:

1. **Backup da configuração existente:**
```bash
cp -r .claude .claude.backup.$(date +%Y%m%d_%H%M%S)
```

2. **Mesclar TODO o conteúdo do template:**
```bash
# Clonar o template do GitHub
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template

# Mesclar todo o conteúdo do template (todas as pastas)
cp -r temp-template/template/.claude/* .claude/

# Limpar diretório temporário
rm -rf temp-template
```

## Atualizar Memória do Projeto:

1. **Para projetos novos:**
```bash
# Criar memória específica para o projeto Isabella
cat << 'EOF' > .claude/memory/project/isabella-project.md
---
name: Isabella Siqueira Advocacia Website
description: Projeto do website para escritório de advocacia
type: project
---

# Project Context: Isabella Siqueira Advocacia

## Current Project
- Name: Website Isabella Siqueira Advocacia
- Type: Website jurídico profissional
- Technologies: HTML, CSS, JavaScript
- Development Stage: Implementation and testing
- Focus Areas: Design profissional, informações legais, contato fácil
- Client: Isabella Siqueira - Advogada
