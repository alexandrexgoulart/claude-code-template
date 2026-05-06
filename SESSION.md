# Sessão de Trabalho - Claude Code Template

**Última atualização:** Mai 2026
**Status:** Em andamento

---

## Ferramenta Usada

- **Ferramenta:** OpenCode
- **Modelo:** minimax-m2.5-free

---

## Contexto do Projeto

### O que é
Template do Claude Code para novos projetos com 287 skills, 61 agentes, sistema de memória persistente

### URLs
- **GitHub:** https://github.com/alexandrexgoulart/claude-code-template
- **Local:** N/A (template)

### Stack/Tecnologias
- TypeScript, Python, Shell, PowerShell
- 287 skills, 61 agentes

---

## Estrutura de Arquivos

```
.claude/          # 287 skills, 61 agentes
docs/            # Documentação
scripts/          # Scripts de setup (inclui install.ps1)
CLAUDE.md         # Configurações
SESSION.md        # Memória do projeto
INSTALL.md        # Guia rápido
.gitignore
```

---

## Funcionalidades Implementadas

- Script `install.ps1` para instalação automática:
  1. Clone o template
  2. Copia TODOS os arquivos
  3. Inicializa memória automaticamente
- Documentação atualizada com passo a passo claro
- Arquivo INSTALL.md com guia rápido
- Sistema de memória persistente (SESSION.md)

---

## Problemas Conhecidos

- **RESOLVIDO:** Usuários estavam copiando apenas pasta `.claude` em vez de todos os arquivos

---

## Tarefas Próximas

- Testar o install.ps1 em novo projeto

---

## Observações Importantes

### Para NOVO PROJETO (RECOMENDADO):
```powershell
git clone https://github.com/alexandrexgoulart/claude-code-template.git novo-projeto
cd novo-projeto
.\scripts\install.ps1
```
**Isso faz TUDO: clone + copia arquivos + inicializa memória**

### Para instalação manual:
```powershell
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp
Copy-Item -Path "temp\*" -Destination "." -Recurse -Force
Remove-Item -Recurse -Force temp
.\scripts\memory-manager.bat --init
```

---

*Atualizado automaticamente ao final de cada sessão.*