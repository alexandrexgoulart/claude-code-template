# CLAUDE.md — Instruções de Contexto para Claude Code

> Este arquivo é carregado automaticamente pelo Claude Code ao iniciar qualquer sessão.
> Mantenha-o atualizado. Ele é a fonte de verdade do projeto para a LLM.

---

## 1. Sobre Este Projeto

<!-- Preencha após instalar o template -->
- **Nome:** [Nome do projeto]
- **Descrição:** [O que este projeto faz em 1-2 frases]
- **Repositório:** [URL do GitHub]
- **Stack:** [Ex: Next.js 14 + TypeScript + PostgreSQL + Prisma]
- **Fase:** [Início / Desenvolvimento / Testes / Produção]

---

## 2. Como Rodar o Projeto

```bash
# Instalar dependências
[npm install / pip install -r requirements.txt / go mod download]

# Variáveis de ambiente
cp .env.example .env
# Edite .env com suas chaves

# Rodar em desenvolvimento
[npm run dev / python manage.py runserver / go run main.go]

# Rodar testes
[npm test / pytest / go test ./...]
```

---

## 3. Estrutura do Projeto

<!-- Atualize conforme o projeto cresce -->
```
[cole aqui a estrutura principal do projeto]
```

---

## 4. Decisões Arquiteturais Importantes

<!-- Documente aqui as decisões que não devem ser questionadas -->
- [Ex: Usamos Prisma e não Drizzle porque tem melhor type safety]
- [Ex: Autenticação via JWT em httpOnly cookies, não localStorage]
- [Ex: Estado global via Zustand, não Redux]

---

## 5. O Que Está Sendo Construído Agora

<!-- Atualize isto a cada sessão. É o contexto mais importante para a LLM. -->
**Tarefa atual:** [Descreva o que está sendo implementado agora]

**Progresso:**
- ✅ [O que já está funcionando]
- 🔄 [O que está em progresso]
- ❌ [O que ainda não foi feito]

**Próximo passo:** [O passo exato para continuar]

---

## 6. O Que NÃO Fazer (lições aprendidas)

<!-- Documente abordagens que falharam para não repetir -->
- [Ex: Não use next-auth neste projeto — conflita com nosso Prisma adapter]
- [Ex: Não use localStorage para tokens — causa hydration mismatch no SSR]

---

## 7. Regras do Projeto

- Commits no formato Conventional Commits (`feat:`, `fix:`, `chore:`, etc.)
- Testes obrigatórios para toda nova feature (cobertura mínima 80%)
- Sem secrets hardcoded — sempre via variáveis de ambiente
- Antes de qualquer PR: `npm run lint && npm test`

---

## 8. Comandos Úteis do Claude Code

| Comando | O que faz |
|---------|-----------|
| `/save-session` | Salva o estado completo da sessão atual |
| `/resume-session` | Carrega contexto da última sessão salva |
| `/update-docs` | Sincroniza documentação com o código |
| `/tdd` | Inicia fluxo de desenvolvimento orientado a testes |
| `/security-auditor` | Revisa o código em busca de vulnerabilidades |
| `/plan` | Planeja uma feature antes de implementar |

**Atualizar contexto da memória:**
```bash
bash .claude/tools/update-project-memory.sh
# ou com análise de TODOs:
bash .claude/tools/update-project-memory.sh --full
```

---

## 9. Variáveis de Ambiente Necessárias

| Variável | Obrigatória | Descrição |
|----------|-------------|-----------|
| `DATABASE_URL` | Sim | URL de conexão com o banco |
| `JWT_SECRET` | Sim | Chave para assinar tokens JWT |
| [adicione as suas] | | |

---

## 10. Contexto Atualizado Automaticamente

Os arquivos abaixo são gerados automaticamente pelo script `update-project-memory.sh`:
- `.claude/memory/project/current_project.md` — estado atual detectado do projeto
- `.claude/memory/project/CONTEXT_SNAPSHOT.md` — snapshot com git log e arquivos recentes

Execute `bash .claude/tools/update-project-memory.sh` sempre que:
- Iniciar uma nova sessão após longa pausa
- Trocar de branch ou feature
- Quiser garantir que o Claude tem o contexto mais atualizado