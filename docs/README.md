# Claude Code Template

Template completo do Claude Code com todas as configurações necessárias.

## Sistema de Memória Persistente

Este template inclui um sistema de memória que mantém o contexto do projeto entre sessões.

### Como funciona:
1. O `CLAUDE.md` instrui o Claude a ler o `SESSION.md` automaticamente
2. Cada projeto tem seu próprio `SESSION.md` na raiz
3. Ao final de cada sessão, o contexto é salvo automaticamente

### Primeiros passos:
```bash
# Para projetos novos (já vem com o template)
# O SESSION.md é criado automaticamente na primeira sessão

# Para projetos existentes:
scripts/memory-manager.bat --init

# Integração com memória:
scripts/integrate-claude-template.sh --with-memory
```

---

## Como Usar

### Para projetos Novos (sem .claude existente):
1. Clone este template
2. Copie a pasta `.claude` para seu projeto
3. Execute `scripts/memory-manager.bat --init` (opcional)

### Para projetos COM .claude existente:
1. Faça backup da configuração existente
2. Execute: `bash scripts/integrate-claude-template.sh`
3. Ou com memória: `bash scripts/integrate-claude-template.sh --with-memory`

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
| `scripts/integrate-claude-template.sh --with-memory` | Integração com sistema de memória |
| `scripts/deploy.sh` | Instruções para deploy |
| `scripts/clear-memory.sh` | Limpar memória do projeto |
| `scripts/memory-manager.sh` | Gerenciador de memória (Bash/Linux) |
| `scripts/memory-manager.bat` | Gerenciador de memória (Windows) |

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