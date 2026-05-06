# Claude Code Template - Documentação Completa

## Visão Geral

Template do Claude Code completamente atualizado com:
- **287 skills** pré-configuradas para diferentes casos de uso
- **61 agentes** especializados para automação de tarefas
- **Sistema de memória persistente** (SESSION.md) para contexto entre sessões
- Integração completa com GitHub e outros serviços

## Sistema de Memória Persistente

O template inclui um sistema de memória que mantém o contexto do projeto automaticamente entre sessões.

### Arquivos do Sistema

| Arquivo | Localização | Descrição |
|---------|-------------|-----------|
| `CLAUDE.md` | Raiz do projeto | Instrui a leitura do SESSION.md |
| `SESSION.md` | Raiz do projeto | Memória do projeto (único por projeto) |
| `memory-manager.sh` | `scripts/` | Gerenciador Bash |
| `memory-manager.bat` | `scripts/` | Gerenciador Windows |

### Como Funciona

1. Ao iniciar sessão, o Claude lê CLAUDE.md → instruído a ler SESSION.md
2. O SESSION.md contém contexto completo do projeto
3. Ao final da sessão, contexto é atualizado automaticamente
4. Próximas sessões carregam contexto automaticamente

### Uso

```bash
# Inicializar memória
scripts/memory-manager.bat --init

# Ver memória atual
scripts/memory-manager.bat --show

# Backup
scripts/memory-manager.bat --backup

# Integração com memória
scripts/integrate-claude-template.sh --with-memory
```

## Como Usar em Projetos Existentes

### Para projetos SEM pasta .claude existente:

**Bash (Linux/Mac/Git Bash):**
```bash
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template
cp -r temp-template/.claude ./
rm -rf temp-template
```

**PowerShell (Windows):**
```powershell
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template
Copy-Item -Path "temp-template\.claude" -Destination ".claude" -Recurse -Force
Remove-Item -Recurse -Force temp-template
```

### Para projetos COM pasta .claude existente:

**Bash (Linux/Mac/Git Bash):**
```bash
cp -r .claude .claude.backup.$(date +%Y%m%d_%H%M%S)
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template
cp -r temp-template/.claude/* .claude/
rm -rf temp-template
```

**PowerShell (Windows):**
```powershell
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
Copy-Item -Path ".claude" -Destination ".claude.backup.$timestamp" -Recurse -Force
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template
Copy-Item -Path "temp-template\.claude\*" -Destination ".claude\" -Recurse -Force
Remove-Item -Recurse -Force temp-template
```

## Estrutura Completa do Claude Code

```
.claude/
├── agents/           # 61 agentes especializados
├── commands/         # 25+ comandos personalizados
├── memory/           # Sistema de memória
├── mcp-servers/      # Servidores MCP
├── plugins/          # Plugins e extensões
├── projects/         # Gerenciamento de projetos
├── prompts/          # Prompts do sistema
├── rules/            # 10+ regras e diretrizes
├── skills/           # 287 skills e habilidades
├── templates/        # Templates para geração de código
└── tools/           # Scripts e utilitários auxiliares
```

## Estatísticas do Template

| Recurso | Quantidade |
|---------|------------|
| Skills | 287 |
| Agentes | 61 |
| Comandos | 25+ |
| Regras | 10+ |
| Ferramentas | 20+ |

## Comandos Disponíveis

| Comando | Descrição |
|---------|-----------|
| `/setup` | Configuração inicial |
| `/integrate` | Integração com projetos existentes |
| `/code-review` | Revisão de código automática |
| `/e2e` | Testes end-to-end |
| `/eval` | Avaliação de desempenho |
| `/docs` | Geração de documentação |

## Atualização da Memória

Para manter o contexto atualizado automaticamente:

```bash
# Atualizar memória do projeto
bash .claude/tools/update-project-memory.sh

# ou com análise de TODOs:
bash .claude/tools/update-project-memory.sh --full
```

## Tecnologias do Projeto

| Categoria | Tecnologia |
|-----------|------------|
| Runtime | Node.js LTS (produção), Bun (scripts locais) |
| Build | Vite |
| Testes | Vitest |
| Linting | Biome |
| Frontend | React 19 |
| Backend | Litestar (Python) |
| Package Manager | pnpm