# Claude Code Template - Guia Completo de Uso

## Para Projetos Novos (sem .claude)

1. **Copiar o template**:
   ```bash
   cp -r /caminho/do/template/NOVA\ PASTA/.claude .claude/
   ```

2. **Ou usar o script de setup**:
   ```bash
   ./setup.sh
   ```

## Para Projetos com .claude Existente

1. **Backup da configuração existente**:
   ```bash
   cp -r .claude .claude.backup
   ```

2. **Mesclar conteúdo do template**:
   ```bash
   # Copiar skills e agentes adicionais
   cp -r /caminho/do/template/NOVA\ PASTA/.claude/skills/* .claude/skills/
   ```

## Benefícios da Integração

- **229 skills** pré-configuradas
- **92 agentes** especializados
- **Sistema de memória** funcional
- **Todos os comandos e regras** prontos para uso

## Como usar:
- **Claude Code** normalmente integrado
- **Skills e agentes** já configurados
- **Setup automático** completo do Claude Code

## Documentação Adicional
A documentação está disponível no repositório.
