# Claude Code Template - Guia Completo de Uso

## Visão Geral

Este template completo do Claude Code já está configurado com **229 skills** e **92 agentes** pré-configurados para uso imediato.

## Como Usar em Projetos Existentes

### Para projetos SEM pasta .claude existente:

1. **Exemplo com o projeto Isabella Siqueira Advocacia:**
```bash
# Navegar até o diretório do projeto
cd "/c/Users/Alexandre/OneDrive/((((IMPORTANTE))))/Clientes VirtuAi 20/Opencode_Teste/isabella-siqueira-advocacia"

# Copiar o template completo
cp -r "/caminho/do/template/NOVA PASTA/.claude" .claude/
```

### Para projetos COM pasta .claude existente:

1. **Backup da configuração existente:**
```bash
cp -r .claude/.claude.backup
```

2. **Mesclar conteúdo do template:**
```bash
# Copiar todas as pastas do template
cp -r "/caminho/do/template/NOVA PASTA/.claude"/* .claude/

# Ou mesclar skills e agentes adicionais:
cp -r "/caminho/do/template/NOVA PASTA/.claude/skills"/* .claude/skills/
cp -r "/caminho/do/template/NOVA PASTA/.claude/agents"/* .claude/agents/
```

## Atualizar Memória do Projeto:

1. **Para projetos novos:**
```bash
cp -r "/caminho/do/template/NOVA PASTA/.claude/memory/project/current_project.md" .claude/memory/project/
```

2. **Atualizar memória do projeto específico:**
```bash
# Atualizar memória do projeto Isabella
cp "/caminho/do/template/NOVA PASTA/.claude/memory/project/isabella-project.md" .claude/memory/project/
```

## Estrutura Completa do Claude Code:

```
.claude/
├── agents/          # 92 agentes especializados
├── commands/        # Comandos disponíveis
├── memory/         # Sistema de memória persistente
├── projects/        # Configurações de projeto
├── prompts/         # Prompts organizados
├── rules/          # Regras e configurações
├── skills/         # 229 skills disponíveis
└── tools/          # Ferramentas auxiliares
```

## Comandos Úteis:

- **Setup automático completo** do Claude Code
- **Integração fácil** com projetos existentes
- **Documentação completa** e skills prontas para uso

## Benefícios:

- **229 skills** pré-configuradas
- **92 agentes** especializados
- **Sistema de memória** funcional
