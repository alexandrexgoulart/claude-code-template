# Claude Code Template - Documentação Completa

## Visão Geral

Template completo do Claude Code com 287 skills e 61 agentes especializados prontos para uso.

## Sistema de Memória Persistente

Este template inclui um sistema de memória persistente que mantém o contexto do projeto entre sessões.

### Como Funciona

1. O arquivo `CLAUDE.md` instrui o Claude/OpenCode a ler o `SESSION.md` ao iniciar
2. O `SESSION.md` contém todo o contexto do projeto (funcionalidades, tarefas, problemas)
3. Ao final de cada sessão, o Claude atualiza automaticamente o `SESSION.md`
4. Próximas sessões carregam o contexto automaticamente

### Arquivos do Sistema

| Arquivo | Localização | Descrição |
|--------|-------------|-----------|
| `CLAUDE.md` | Raiz do projeto | Instrui leitura de SESSION.md |
| `SESSION.md` | Raiz do projeto | Arquivo de memória (único por projeto) |
| `SESSION_TEMPLATE.md` | `.claude/memory/templates/` | Template para novos projetos |
| `memory-manager.sh` | `scripts/` | Gerenciador Bash |
| `memory-manager.bat` | `scripts/` | Gerenciador Windows |

---

## Instalação em Novo Projeto

### Windows (PowerShell - RECOMENDADO)

```powershell
# 1. Clone o template
git clone https://github.com/alexandrexgoulart/claude-code-template.git novo-projeto

# 2. Entre no directorio
cd novo-projeto

# 3. Execute o script de instalacao (copia TODOS os arquivos automatico)
.\scripts\install.ps1
```

### Windows (Manual)

```powershell
# 1. Clone o template
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template

# 2. COPIE TODOS OS ARQUIVOS (nao apenas .claude!)
Copy-Item -Path "temp-template\*" -Destination "." -Recurse -Force

# 3. Copie arquivos ocultos
Copy-Item -Path "temp-template\.gitignore" -Destination "." -Force
Copy-Item -Path "temp-template\.claude" -Destination "." -Recurse -Force

# 4. Remova o temporario
Remove-Item -Recurse -Force temp-template

# 5. Inicialize a memoria
.\scripts\memory-manager.bat --init
```

### Linux/Mac

```bash
# 1. Clone o template
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template

# 2. Copie TODOS OS ARQUIVOS
cp -r temp-template/* .
cp -r temp-template/.* . 2>/dev/null || true

# 3. Remova o temporario
rm -rf temp-template

# 4. Inicialize a memoria
bash scripts/memory-manager.sh --init
```

### Erro Comum: Clone Incompleto

Se o clone vier incompleto, tente:

```powershell
# Clone profonde
git clone --depth 1 https://github.com/alexandrexgoulart/claude-code-template.git temp-test

# Se shallow, busque tudo
cd temp-test
git fetch --unshallow

# Verifique o que veio
Get-ChildItem -Name
```

---

## Uso do Sistema de Memória

```powershell
# Inicializar memória (projeto novo)
scripts\memory-manager.bat --init

# Mostrar memória atual
scripts\memory-manager.bat --show

# Criar backup
scripts\memory-manager.bat --backup

# Restaurar backup
scripts\memory-manager.bat --restore
```

### Integração com Memória

```bash
# Integração padrão
scripts/integrate-claude-template.sh

# Integração COM sistema de memória
scripts/integrate-claude-template.sh --with-memory
# ou
scripts/integrate-claude-template.sh -m
```

---

## Para Novo Projeto

1. Clone o template e copie o `.claude/` para seu projeto
2. Inicie uma sessão com OpenCode/Claude/Jan.ai
3. O sistema detectará que não existe `SESSION.md` e criará automaticamente
4. Na primeira sessão, responda as perguntas sobre o projeto
5. O contexto será salvo automaticamente

---

## Para Projeto Existente

### Para projetos SEM pasta .claude existente:

```bash
# Clone o template do repositório oficial
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template
cp -r temp-template/* ./
cp -r temp-template/.* . 2>/dev/null || true
rm -rf temp-template
```

### Para projetos COM pasta .claude existente:

```bash
# Backup da configuração existente (recomendado)
cp -r .claude .claude.backup.$(date +%Y%m%d_%H%M%S)

# Mesclar todo o conteúdo do template
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template
cp -r temp-template/* ./
cp -r temp-template/.claude/* .claude/ 2>/dev/null || true
rm -rf temp-template
```

---

## Estrutura Completa do Claude Code

```
.claude/
├── agents/           # 61 agentes especializados para tarefas específicas
├── commands/         # Comandos personalizados do Claude Code
├── memory/           # Sistema de memória para contexto persistente
├── mcp-servers/     # Servidores MCP para integração com ferramentas externas
├── plugins/          # Plugins e extensões do Claude Code
├── projects/        # Gerenciamento de projetos e sessões
├── prompts/         # Prompts do sistema
├── rules/           # Regras e diretrizes do projeto
├── skills/          # 287 skills e habilidades do Claude Code
├── templates/       # Templates para geração de código
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
| `/setup` | Configuração inicial do Claude Code |
| `/integrate` | Integração com projetos existentes |
| `/update` | Atualização de contexto e memória |
| `/deploy` | Deploy do template em ambiente de produção |
| `/test` | Execução de testes automatizados |
| `/code-review` | Revisão de código automática |
| `/eval` | Avaliação de desempenho do agente |
| `/e2e` | Testes end-to-end |

## Scripts do Projeto

```bash
# Setup básico
bash scripts/setup.sh

# Novo projeto
bash scripts/new-project-setup.sh

# Instalação (Windows)
.\scripts\install.ps1

# Integração
bash scripts/integrate-claude-template.sh

# Deploy
bash scripts/deploy.sh

# Limpar memória
bash scripts/clear-memory.sh

# Gerenciar memória (Windows)
.\scripts\memory-manager.bat
```

## Atualização da Memória do Projeto

Para manter o contexto atualizado automaticamente:

```bash
# Atualizar memória do projeto
bash .claude/tools/update-project-memory.sh
# ou com análise de TODOs:
bash .claude/tools/update-project-memory.sh --full
```

---

## Estrutura de Diretórios do Projeto

O template segue a estrutura Clean Architecture:

```
src/
├── core/           # Lógica de negócio central (domain logic)
├── adapters/       # Adaptadores para interfaces externas
├── ports/          # Interfaces e contratos (abstrações)
├── services/       # Serviços da aplicação
├── utils/          # Funções utilitárias
├── types/          # Definições de tipos TypeScript
├── config/         # Configurações da aplicação
├── cli/            # Interface de linha de comando
└── app/            # Ponto de entrada da aplicação
```

## Convenções de Código

- **TypeScript** - Sempre use tipos explícitos, nunca use `any`
- **Python** - Type hints obrigatórios
- **Nomenclatura:**
  - Variáveis e funções: camelCase
  - Classes e componentes: PascalCase
  - Constantes: UPPER_SNAKE_CASE
- **Princípios:** SOLID, DRY, KISS
- **Funções pequenas:** máximo 50 linhas
- **Aninhamento:** máximo 4 níveis

## Tecnologias Padrão

| Categoria | Tecnologia |
|-----------|------------|
| Runtime | Node.js LTS (produção), Bun (scripts locais) |
| Build | Vite |
| Testes | Vitest |
| Linting | Biome |
| Frontend | React 19 |
| Backend | Litestar (Python) |
| Package Manager | pnpm |

## Recursos Adicionais

- [Conventional Commits](https://conventionalcommits.org)
- [Biome](https://biomejs.dev)
- [Vitest](https://vitest.dev)
- [React 19](https://react.dev)