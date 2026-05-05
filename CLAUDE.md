# CLAUDE.md - Projeto Claude Code Template

## Visão Geral do Projeto

Este é um template de projeto para desenvolvimento com Claude Code, seguindo padrões de Clean Architecture e práticas modernas de desenvolvimento de software.

**Stack Principal:** TypeScript (frontend/backend), Python (scripts)
**Package Manager:** pnpm

## Estrutura de Diretórios

```
projeto/
├── .claude/              # Configurações do Claude Code
│   ├── agents/           # 61 agentes especializados
│   ├── commands/         # Comandos personalizados
│   ├── skills/           # 287 skills
│   ├── rules/            # Regras do projeto
│   ├── tools/            # Ferramentas e hooks
│   └── memory/           # Sistema de memória
├── src/                  # Código fonte da aplicação
│   ├── core/             # Lógica de negócio central
│   ├── adapters/         # Adaptadores para interfaces externas
│   ├── ports/            # Interfaces e contratos
│   ├── services/         # Serviços da aplicação
│   ├── utils/            # Funções utilitárias
│   ├── types/            # Definições de tipos TypeScript
│   ├── config/           # Configurações da aplicação
│   ├── cli/              # Interface de linha de comando
│   └── app/              # Ponto de entrada da aplicação
├── scripts/              # Scripts de setup e manutenção
│   ├── setup.sh          # Configuração básica
│   ├── new-project-setup.sh  # Setup de novos projetos
│   ├── integrate-claude-template.sh  # Integração
│   ├── deploy.sh         # Deploy
│   └── clear-memory.sh   # Limpar memória
├── docs/                 # Documentação do projeto
│   ├── README.md         # Visão geral
│   ├── claude-code-docs.md
│   ├── claude-code-template.md
│   └── CLAUDE_CODE_PROJECT_STRUCTURE.md
├── CLAUDE.md             # Este arquivo - configurações do Claude Code
└── package.json          # Dependências do projeto
```

## Convenções de Código

### Nomenclatura
- **Variáveis e funções:** camelCase
- **Classes e componentes:** PascalCase
- **Constantes:** UPPER_SNAKE_CASE
- **Arquivos de componentes:** PascalCase.tsx

### Regras de TypeScript
- Sempre use tipos explícitos
- Nunca use `any` - prefira `unknown` ou tipos específicos
- Habilite `strict: true` no tsconfig.json
- Use `satisfies` quando apropriado para inferência de tipos

### Princípios
- **SOLID** - Princípios de design orientado a objetos
- **DRY** - Don't Repeat Yourself
- **KISS** - Keep It Simple, Stupid
- Funções pequenas (máx 50 linhas)
- Aninhamento máximo de 4 níveis
- Prefira imutabilidade

### Documentação
- Documente funções complexas com JSDoc
- Adicione comentários apenas quando necessário para lógica não-obvia
- Mantenha a documentação próxima ao código

## Comandos de Desenvolvimento

```bash
# Instalação de dependências
npm install          # ou pnpm install

# Desenvolvimento
pnpm dev             # Iniciar servidor de desenvolvimento
pnpm start           # Executar aplicação em modo produção

# Build
pnpm build           # Build de produção

# Testes
pnpm test            # Executar todos os testes
pnpm test:watch      # Testes em modo watch
pnpm test:coverage   # Testes com cobertura

# Linting e Formatação
pnpm lint            # Verificar código
pnpm lint:fix        # Corrigir erros de lint automaticamente
pnpm format          # Formatar código

# Segurança
pnpm security        # Verificar vulnerabilidades
```

## Tecnologias e Ferramentas

| Categoria | Tecnologia |
|-----------|------------|
| Runtime | Node.js LTS (produção), Bun (scripts locais) |
| Build | Vite |
| Testes | Vitest |
| Linting | Biome |
| Frontend | React 19 |
| Backend | Litestar (Python) |
| Package Manager | pnpm |

## Fluxo de Trabalho

### Desenvolvimento
1. Crie uma branch para a funcionalidade: `git checkout -b feature/nome`
2. Implemente a funcionalidade seguindo TDD
3. Execute testes: `pnpm test`
4. Execute lint: `pnpm lint`
5. Faça commit seguindo Conventional Commits

### Conventional Commits
```
feat: add new feature
fix: resolve bug
docs: update documentation
style: code formatting
refactor: restructure code
test: add/update tests
chore: maintenance tasks
```

### Pull Requests
- Revisão de código obrigatória
- Todos os testes devem passar
- Cobertura mínima de 80%
- Verificação de segurança

## Requisitos de Qualidade

### Testes
- Mínimo 80% de cobertura nas funcionalidades principais
- Testes unitários para lógica de negócio
- Testes de integração para APIs
- Testes E2E para fluxos críticos

### Segurança
- Nunca commite segredos ou credenciais
- Valide todas as entradas do usuário
- Use consultas parametrizadas (evite SQL injection)
- Siga práticas OWASP Top 10
- Execute scan de segurança antes do deploy

### Performance
- Otimize bundles com code splitting
- Use lazy loading para rotas
- Implemente cache apropriado
- Monitore métricas de performance

## Integrações do Claude Code

### Recursos do Projeto
- **287 skills** disponíveis em `.claude/skills/`
- **61 agentes** especializados em `.claude/agents/`
- **25+ comandos** personalizados em `.claude/commands/`
- **20+ ferramentas** em `.claude/tools/`
- **10+ regras** em `.claude/rules/`

### Estrutura do .claude
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

### Scripts do Projeto

| Script | Descrição |
|--------|-----------|
| `scripts/setup.sh` | Configuração básica do template |
| `scripts/new-project-setup.sh` | Setup automático para novos projetos |
| `scripts/integrate-claude-template.sh` | Integração com projetos existentes |
| `scripts/deploy.sh` | Instruções para deploy |
| `scripts/clear-memory.sh` | Limpar memória do projeto |

### Comandos do Claude Code
- `/setup` - Configuração inicial
- `/integrate` - Integração com projetos existentes
- `/code-review` - Revisão automática de código
- `/e2e` - Testes end-to-end
- `/eval` - Avaliação de desempenho
- `/docs` - Geração de documentação

### Skills Populares
- **tdd-workflow** - Desenvolvimento orientado a testes
- **biome** - Linting e formatação
- **testing** - Testes unitários e integração
- **security-review** - Análise de segurança
- **react-patterns** - Padrões React
- **python-patterns** - Padrões Python

### Regras Técnicas
Consulte `.claude/rules/tech-strategy.md` para estratégias técnicas específicas.

## Configurações Adicionais

### Variáveis de Ambiente
- Crie `.env.local` para desenvolvimento
- Use `.env.example` como template
- Nunca commit o `.env` real

### Git Hooks
Os hooks estão configurados para:
- Pre-commit: lint e testes
- Pre-push: testes de integração
- Commit-msg: validação do formato de commit

## Recursos Adicionais

- [Conventional Commits](https://conventionalcommits.org)
- [Biome](https://biomejs.dev)
- [Vitest](https://vitest.dev)
- [React 19](https://react.dev)