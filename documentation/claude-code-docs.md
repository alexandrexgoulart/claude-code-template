# Claude Code Template - Documentação Completa

## Como Usar em Projetos Existentes

### Para projetos SEM pasta .claude existente:

1. **Exemplo com o projeto Isabella Siqueira Advocacia:**
```bash
# Navegar até o diretório do projeto
cd "/c/Users/Alexandre/OneDrive/((((IMPORTANTE))))/Clientes VirtuAi 2.0/Opencode_Teste/isabella-siqueira-advocacia"

# Copiar o template completo do GitHub
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template
cp -r temp-template/template/.claude .claude/
# No Windows, use:
# xcopy temp-template\template\claude\* .claude\ /E /I
# ou
# Copy-Item -Path "temp-template\template\claude\*" -Destination ".claude" -Recurse
rm -r -fo temp-template

```

### Para projetos COM pasta .claude existente:
```bash
# Backup da configuração existente
cp -r .claude .claude.backup.$(date +%Y%m%d_%H%M%S)
# No Windows, use:
# $date = Get-Date -Format "yyyyMMdd_HHmmss"
# Copy-Item -Path ".claude" -Destination ".claude.backup.$date" -Recurse

# Mesclar todo o conteúdo do template
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template
cp -r temp-template/template/.claude/* .claude/
# No Windows, use:
# xcopy temp-template\template\claude\* .claude\ /E /I
# ou
# Copy-Item -Path "temp-template\template\claude\*" -Destination ".claude" -Recurse
rm -r -fo temp-template

```

## Atualizar Memória do Projeto:

### Para projetos NOVOS:
```bash
# Atualizar memória do projeto Isabella
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
