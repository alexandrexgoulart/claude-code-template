# Claude Code Template - Documentação Completa

## Visão Geral

Template do Claude Code completamente atualizado com:
- **287 skills** pré-configuradas para diferentes casos de uso
- **61 agentes** especializados para automação de tarefas
- Sistema de memória avançado para contexto persistente
- Integração completa com GitHub e outros serviços

## Como Usar em Projetos Existentes

### Para projetos SEM pasta .claude existente:

```bash
# Clone o template oficial
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