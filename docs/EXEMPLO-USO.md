# Exemplo de Uso - Projeto Isabella Siqueira Advocacia

## Para projetos SEM .claude existente:

Caminho: C:\Users\Alexandre\OneDrive\((((IMPORTANTE))))\Clientes VirtuAi 2.0\Opencode_Teste\isabella-siqueira-advocacia

1. Navegar até o projeto:
   cd "/c/Users/Alexandre/OneDrive/((((IMPORTANTE))))/Clientes VirtuAi 2.0/Opencode_Teste/isabella-siqueira-advocacia"

2. Copiar template:
   cp -r "/c/Users/Alexandre/Desktop/Nova pasta/.claude" .claude/

## Para projetos COM .claude existente:

1. Backup:
   cp -r .claude .claude.backup

2. Mesclar:
   cp -r "/c/Users/Alexandre/Desktop/Nova pasta/.claude/skills"/* .claude/skills/
   cp -r "/c/Users/Alexandre/Desktop/Nova pasta/.claude/agents"/* .claude/agents/

## Estrutura do Claude Code:
.claude/
- agents/
- commands/
- memory/
- projects/
- prompts/
- rules/
- skills/
- tools/

## Comandos úteis:
- 229 skills pré-configuradas
- 92 agentes especializados
- Sistema de memória funcional
