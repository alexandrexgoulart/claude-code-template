# Claude Code Template - Documentação Completa

## Visão Geral

Template completo do Claude Code com 287 skills e 61 agentes especializados prontos para uso.

## Como Usar em Projetos Existentes

### Para projetos SEM pasta .claude existente:

```bash
# Clone o template do repositório oficial
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template
cp -r temp-template/.claude ./
rm -rf temp-template
```

### Para projetos COM pasta .claude existente:

```bash
# Backup da configuração existente (recomendado)
cp -r .claude .claude.backup.$(date +%Y%m%d_%H%M%S)

# Mesclar todo o conteúdo do template
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template
cp -r temp-template/.claude/* .claude/
rm -rf temp-template
```

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

# Integração
bash scripts/integrate-claude-template.sh

# Deploy
bash scripts/deploy.sh

# Limpar memória
bash scripts/clear-memory.sh
```

## Atualização da Memória do Projeto

Para manter o contexto atualizado automaticamente:

```bash
# Atualizar memória do projeto
bash .claude/tools/update-project-memory.sh
# ou com análise de TODOs:
bash .claude/tools/update-project-memory.sh --full
```

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