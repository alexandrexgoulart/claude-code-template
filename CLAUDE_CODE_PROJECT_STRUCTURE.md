# CLAUDE Code Project Structure Guide

## Estrutura do Projeto

O projeto CLAUDE Code segue uma estrutura específica que deve ser mantida para garantir a consistência e o funcionamento correto das ferramentas.

### Diretórios Principais

1. **.claude** - Diretório principal com configurações e recursos do projeto
2. **claude-code-template** - Template do projeto que pode ser usado como base para novos projetos
3. **_temp_repos** - Diretório temporário para repositórios clonados (não versionado)

## Estrutura da pasta .claude

A pasta `.claude` contém todos os recursos essenciais do framework CLAUDE Code:

```
.claude/
├── agents/           # Agentes especializados
├── commands/         # Comandos personalizados
├── memory/            # Sistema de memória do projeto
├── mcp-servers/      # Servidores MCP para integração com ferramentas externas
├── plugins/          # Plugins e extensões do Claude Code
├── projects/         # Configurações de projetos
├── prompts/          # Prompts personalizados
├── rules/           # Regras e diretrizes
├── skills/           # Habilidades e competências
├── tools/           # Ferramentas auxiliares
├── tools/hooks/     # Hooks para automação
└── settings.local.json  # Configurações locais
```

## Onde instalar novos recursos

Ao adicionar novos recursos de repositórios clonados:

1. **Agentes** - Copiar para `.claude/agents/`
2. **Comandos** - Copiar para `.claude/commands/` e `.claude/commands/gsd/` (se for comandos GSD)
3. **Habilidades** - Copiar para `.claude/skills/`
4. **Regras** - Copiar para `.claude/rules/` e subdiretórios apropriados
5. **Ferramentas** - Copiar para `.claude/tools/`
6. **Hooks** - Copiar para `.claude/tools/hooks/`
7. **Prompts** - Copiar para `.claude/prompts/`
8. **Memórias** - Copiar para `.claude/memory/` e subdiretórios apropriados
9. **Projetos** - Copiar para `.claude/projects/`

## Boas práticas para integração

- Sempre verificar se os recursos já existem antes de copiar
- Manter consistência na estrutura de diretórios
- Evitar duplicação de arquivos
- Preservar a estrutura existente do projeto
- Manter repositórios em `_temp_repos` para consultas futuras

## Processo de integração

1. Clonar repositórios na pasta `_temp_repos`
2. Analisar conteúdo dos repositórios
3. Copiar apenas os recursos necessários para os diretórios corretos
4. Manter repositório temporário para consulta futura
5. Verificar consistência da estrutura
6. Testar funcionalidades após integração

## Diretrizes para manutenção

- **Nunca** modificar diretamente os arquivos do template
- **Sempre** usar `_temp_repos` para clonagem temporária
- **Manter** a estrutura `.claude` consistente entre projeto e template
- **Verificar** compatibilidade antes de integrar
- **Manter repositórios em `_temp_repos` para consultas futuras

## Atualizações Recentes

A estrutura foi atualizada para incluir:
- Diretório `.claude/mcp-servers/` para melhor organização dos servidores MCP
- Sincronização automática entre projeto principal e template
- Melhor organização de plugins e skills
- Preservação de repositórios temporários para consulta futura