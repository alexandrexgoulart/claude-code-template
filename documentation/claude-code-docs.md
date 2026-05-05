# Claude Code Template - Documentação Completa e Atualizada

## Estrutura Atualizada do Projeto

O template do Claude Code foi completamente atualizado e aprimorado para refletir as práticas
mais recentes do Claude Code com:
- 229 skills pré-configuradas para diferentes casos de uso
- 92 agentes especializados para automação de tarefas
- Sistema de memória avançado para contexto persistente
- Integração completa com GitHub e outros serviços

## Como Usar em Projetos Existentes

### Para projetos SEM pasta .claude existente:

```bash
# Clonar o template oficial
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template
cp -r temp-template/template/.claude .claude/
rm -r -fo temp-template
```

### Para projetos COM pasta .claude existente:
```bash
# Backup da configuração existente (recomendado)
cp -r .claude .claude.backup.$(date +%Y%m%d_%H%M%S)

# Mesclar todo o conteúdo do template
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp-template
cp -r temp-template/template/.claude/* .claude/
rm -r -fo temp-template
```

## Estrutura Completa do Claude Code:
```
.claude/
├── agents/          # Agentes especializados para tarefas específicas
├── commands/         # Comandos personalizados do Claude Code
├── memory/            # Sistema de memória para contexto persistente
├── mcp-servers/      # Servidores MCP para integração com ferramentas externas
├── plugins/          # Plugins e extensões do Claude Code
├── projects/         # Gerenciamento de projetos e sessões
├── prompts/          # Prompts do sistema
├── rules/            # Regras e convenções do projeto
├── skills/           # Skills e habilidades do Claude Code
├── templates/         # Templates para geração de código
└── tools/           # Scripts e utilitários auxiliares
```

## Comandos Úteis:

- **Setup automático** completo do Claude Code
- **Integração fácil** com projetos existentes
- **Documentação completa** e skills prontas para uso
- **Sistema de memória** avançado para contexto persistente
- **229 skills pré-configuradas** para diversos casos de uso
- **92 agentes especializados** para automação de tarefas

## Atualização Automática da Memória

Para manter o contexto atualizado automaticamente:

```bash
# Atualizar memória do projeto
bash .claude/tools/update-project-memory.sh
# ou com análise de TODOs:
bash .claude/tools/update-project-memory.sh --full
```

## Estrutura do Projeto Atual

O template inclui:
- **92 agentes** especializados em diferentes áreas
- **229 skills** pré-configuradas para diversos casos de uso
- **Sistema de memória** avançado para contexto persistente
- **Integração com GitHub** e outros serviços
- **Configuração automática** do Claude Code