# CLAUDE Code Project Structure Guide

## Visão Geral

O projeto CLAUDE Code segue uma estrutura específica que deve ser mantida para garantir a consistência e o funcionamento correto das ferramentas.

## Estrutura do Projeto

O projeto segue uma arquitetura Clean Architecture com a seguinte estrutura de código:

```
src/
├── core/           # Lógica de negócio central (domain logic)
├── adapters/       # Adaptadores para interfaces externas
├── ports/          # Interfaces e contratos (abstrações)
├── services/      # Serviços da aplicação
├── utils/         # Funções utilitárias
├── types/         # Definições de tipos TypeScript
├── config/        # Configurações da aplicação
├── cli/           # Interface de linha de comando
└── app/           # Ponto de entrada da aplicação
```

## Estrutura da pasta .claude

A pasta `.claude` contém todos os recursos essenciais do framework CLAUDE Code:

```
.claude/
├── agents/           # 61 agentes especializados
├── commands/         # 25+ comandos personalizados
├── memory/           # Sistema de memória do projeto
├── mcp-servers/      # Servidores MCP para integração
├── plugins/          # Plugins e extensões
├── projects/         # Configurações de projetos
├── prompts/          # Prompts personalizados
├── rules/            # 10+ regras e diretrizes
├── skills/           # 287 skills e habilidades
├── templates/        # Templates para geração de código
├── tools/            # Ferramentas auxiliares
└── tools/hooks/      # Hooks para automação
```

## Estatísticas do Template

| Recurso | Quantidade |
|---------|------------|
| Skills | 287 |
| Agentes | 61 |
| Comandos | 25+ |
| Regras | 10+ |
| Ferramentas | 20+ |

## Onde instalar novos recursos

Ao adicionar novos recursos de repositórios clonados:

1. **Agentes** - Copiar para `.claude/agents/`
2. **Comandos** - Copiar para `.claude/commands/`
3. **Skills** - Copiar para `.claude/skills/`
4. **Regras** - Copiar para `.claude/rules/` e subdiretórios apropriados
5. **Ferramentas** - Copiar para `.claude/tools/`
6. **Hooks** - Copiar para `.claude/tools/hooks/`
7. **Prompts** - Copiar para `.claude/prompts/`
8. **Memórias** - Copiar para `.claude/memory/`
9. **Projetos** - Copiar para `.claude/projects/`

## Boas práticas para integração

- Sempre verificar se os recursos já existem antes de copiar
- Manter consistência na estrutura de diretórios
- Evitar duplicação de arquivos
- Preservar a estrutura existente do projeto

## Scripts do Projeto

| Script | Descrição |
|--------|-----------|
| `setup.sh` | Configuração básica do template |
| `new-project-setup.sh` | Setup automático para novos projetos |
| `integrate-claude-template.sh` | Integração com projetos existentes |
| `deploy.sh` | Instruções para deploy |
| `clear-memory.sh` | Limpar memória do projeto |

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

## Convenções de Código

- **TypeScript** - Sempre use tipos explícitos, nunca use `any`
- **Nomenclatura:**
  - Variáveis e funções: camelCase
  - Classes e componentes: PascalCase
  - Constantes: UPPER_SNAKE_CASE
- **Princípios:** SOLID, DRY, KISS
- **Funções pequenas:** máximo 50 linhas
- **Aninhamento:** máximo 4 níveis