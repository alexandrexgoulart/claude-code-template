# Exemplos Práticos de Uso do Claude Code Template

## Exemplo 1: Projeto SEM pasta .claude existente

### Cenário: Projeto "isabella-siqueira-advocacia"

**Caminho do projeto:** 
\`\`\`
C:\Users\Alexandre\OneDrive\((((IMPORTANTE))))\Clientes VirtuAi 2.0\Opencode_Teste\isabella-siqueira-advocacia
\`\`\`

**Passos para integração:**

1. **Navegar até o diretório do projeto:**
\`\`\`bash
cd "/c/Users/Alexandre/OneDrive/((((IMPORTANTE))))/Clientes VirtuAi 2.0/Opencode_Teste/isabella-siqueira-advocacia"
\`\`\`

2. **Copiar o template completo:**
\`\`\`bash
cp -r "/c/Users/Alexandre/Desktop/Nova pasta/.claude" .claude/
\`\`\`

3. **Resultado:** Projeto agora tem toda a estrutura .claude com 229 skills e 92 agentes

## Exemplo 2: Projeto COM pasta .claude existente

**Cenário:** Projeto já tem configuração Claude Code parcial

**Passos para integração:**

1. **Backup da configuração existente:**
\`\`\`bash
cp -r .claude .claude.backup.\$(date +%Y%m%d_%H%M%S)
\`\`\`

2. **Mesclar conteúdo do template:**
\`\`\`bash
cp -r "/c/Users/Alexandre/Desktop/Nova pasta/.claude/skills"/* .claude/skills/
cp -r "/c/Users/Alexandre/Desktop/Nova pasta/.claude/agents"/* .claude/agents/
\`\`\`

## Exemplo 3: Atualizar memória para contexto específico

**Para o projeto Isabella Siqueira Advocacia:**

1. **Criar memória específica do projeto:**
\`\`\`bash
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
