# Claude Code Template - Guia em Português

## Como Usar em Projetos Existentes

### Para projetos SEM pasta .claude existente:

1. **Para projetos novos (sem .claude)**:
   ```bash
   # Copiar o template
   cp -r /caminho/para/template/NOVA\ PASTA/.claude .claude/
   ```

2. **Para atualizar memória do projeto**:
   ```bash
   # Atualizar memória para o novo contexto
   echo "Atualizando memória do projeto..."
   ```

### Para projetos que JÁ TEM pasta .claude:

1. **Backup da configuração existente**:
   ```bash
   cp -r .claude .claude.backup
   ```

2. **Mesclar conteúdo**:
   ```bash
   # Copiar skills e agentes adicionais
   cp -r /caminho/do/template/NOVA\ PASTA/.claude/skills/* .claude/skills/
   cp -r /caminho/do/template/NOVA\ PASTA/.claude/agents/* .claude/agents/
   ```

## Uso

O template já está integrado! Tudo que você precisa fazer é usar os comandos do Claude Code normalmente.

## Benefícios

- **229 skills** pré-configuradas
- **92 agentes** especializados
- **Sistema de memória** funcional
- **Todos os comandos e regras** prontos para uso
