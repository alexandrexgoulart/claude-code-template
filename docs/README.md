# Claude Code Template

Template completo do Claude Code com todas as configurações necessárias.

## Como Usar

### Para projetos Novos (sem .claude existente):
1. Clone este template
2. Copie a pasta `.claude` para seu projeto

### Para projetos COM .claude existente:
1. Faça backup da configuração existente
2. Execute: `bash scripts/integrate-claude-template.sh`

## Estrutura do Projeto

```
projeto/
├── .claude/              # Configurações do Claude Code
├── src/                  # Código fonte (Clean Architecture)
├── scripts/              # Scripts de setup e manutenção
├── docs/                 # Documentação
├── CLAUDE.md             # Configurações do Claude Code
└── .gitignore
```

## Recursos do Template

- **287 skills** pré-configuradas
- **61 agentes** especializados
- **25+ comandos** personalizados
- **10+ regras** do projeto

## Estrutura do .claude

```
.claude/
├── agents/           # 61 agentes especializados
├── commands/         # Comandos personalizados
├── memory/           # Sistema de memória
├── mcp-servers/      # Servidores MCP
├── plugins/          # Plugins
├── projects/         # Configurações de projetos
├── prompts/          # Prompts do sistema
├── rules/            # Regras do projeto
├── skills/           # 287 skills
├── templates/        # Templates
└── tools/            # Ferramentas e hooks
```

## Scripts Disponíveis

| Script | Descrição |
|--------|-----------|
| `scripts/setup.sh` | Configuração básica do template |
| `scripts/new-project-setup.sh` | Setup automático para novos projetos |
| `scripts/integrate-claude-template.sh` | Integração com projetos existentes |
| `scripts/deploy.sh` | Instruções para deploy |
| `scripts/clear-memory.sh` | Limpar memória do projeto |

## Tecnologias

| Categoria | Tecnologia |
|-----------|------------|
| Runtime | Node.js LTS, Bun |
| Build | Vite |
| Testes | Vitest |
| Linting | Biome |
| Frontend | React 19 |
| Backend | Litestar (Python) |
| Package Manager | pnpm |

## Documentação

Consulte a pasta `docs/` para documentação detalhada:
- `claude-code-template.md` - Guia completo de uso
- `claude-code-docs.md` - Documentação adicional
- `CLAUDE_CODE_PROJECT_STRUCTURE.md` - Estrutura do projeto