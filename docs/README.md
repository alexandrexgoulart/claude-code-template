# Claude Code Template

Template completo do Claude Code com todas as configurações necessárias para 100% de funcionalidade.

## Sistema de Memória Persistente

Este template inclui um sistema de memória que mantém o contexto do projeto entre sessões.

### Como funciona:
1. O `CLAUDE.md` instrui o Claude a ler o `SESSION.md` automaticamente
2. Cada projeto tem seu próprio `SESSION.md` na raiz
3. Ao final de cada sessão, o contexto é salvo automaticamente

---

## Instalação (NOVO PROJETO)

### Opção 1: PowerShell (RECOMENDADO - Windows)
```powershell
# Clone o template
git clone https://github.com/alexandrexgoulart/claude-code-template.git novo-projeto

# Entre no directorio
cd novo-projeto

# Execute o script de instalacao (copia TODOS os arquivos)
.\scripts\install.ps1
```

### Opção 2: Manual (Windows)
```powershell
# Clone o template
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template

# COPIE TODOS OS ARQUIVOS (importante!)
Copy-Item -Path "temp-template\*" -Destination "." -Recurse -Force

# Copie arquivos ocultos
Copy-Item -Path "temp-template\.gitignore" -Destination "." -Force

# Remova o directorio temporario
Remove-Item -Recurse -Force temp-template

# Inicialize a memoria
.\scripts\memory-manager.bat --init
```

### Opção 3: Manual (Linux/Mac)
```bash
# Clone o template
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template

# Copie TODOS OS ARQUIVOS
cp -r temp-template/* .
cp -r temp-template/.* . 2>/dev/null || true

# Remova o directorio temporario
rm -rf temp-template

# Inicialize a memoria
bash scripts/memory-manager.sh --init
```

---

## Como Usar (PROJETOS EXISTENTES)

### Para projetos SEM .claude existente:
1. Clone este template
2. Copie **TODOS** os arquivos (não apenas `.claude`!)
3. Execute `scripts\memory-manager.bat --init`

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
├── SESSION.md           # Memória do projeto (criado automaticamente)
└── .gitignore
```

## Recursos do Template

- **287 skills** pré-configuradas
- **61 agentes** especializados
- **25+ comandos** personalizados
- **10+ regras** do projeto
- Sistema de memória persistente

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
| `scripts/install.ps1` | Script de instalação (NOVO - copiar tudo) |
| `scripts/setup.sh` | Configuração básica do template |
| `scripts/new-project-setup.sh` | Setup automático de novos projetos |
| `scripts/integrate-claude-template.sh` | Integração com projetos existentes |
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

---

## Problema Comum: Clone Incompleto

Se ao clonar vêm apenas arquivos, tente:

```powershell
# Clone profundo
git clone --depth 1 https://github.com/alexandrexgoulart/claude-code-template.git temp-test

# Se shallow, busque tudo
cd temp-test
git fetch --unshallow

# Verifique o que veio
Get-ChildItem -Name
```