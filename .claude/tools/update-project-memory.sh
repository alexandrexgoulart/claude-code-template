#!/bin/bash
# =============================================================================
# update-project-memory.sh
# Lê o projeto atual e atualiza automaticamente .claude/memory/project/
#
# USO:
#   bash .claude/tools/update-project-memory.sh
#   bash .claude/tools/update-project-memory.sh --full   (inclui análise de arquivos)
#
# O QUE FAZ:
#   1. Detecta tecnologias, dependências e estrutura do projeto
#   2. Lê git log para identificar o que foi feito recentemente
#   3. Detecta tarefas pendentes (TODOs, FIXMEs no código)
#   4. Atualiza .claude/memory/project/current_project.md com o estado atual
#   5. Gera .claude/memory/project/CONTEXT_SNAPSHOT.md com snapshot completo
# =============================================================================
set -euo pipefail

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$(pwd)}"
MEMORY_DIR="$PROJECT_DIR/.claude/memory/project"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M')
FULL_MODE="${1:-}"

echo "=== Atualizando Memória do Projeto ==="
echo "Diretório: $PROJECT_DIR"
echo ""

mkdir -p "$MEMORY_DIR"

# ─── 1. DETECTAR NOME E TIPO DO PROJETO ───────────────────────────────────────

PROJECT_NAME=""
PROJECT_TYPE="desconhecido"
TECH_STACK=""
PACKAGE_MANAGER=""

# Nome via git remote
if git -C "$PROJECT_DIR" remote get-url origin &>/dev/null 2>&1; then
  REMOTE=$(git -C "$PROJECT_DIR" remote get-url origin 2>/dev/null || echo "")
  PROJECT_NAME=$(basename "$REMOTE" .git 2>/dev/null || echo "")
fi

# Nome via package.json
if [ -z "$PROJECT_NAME" ] && [ -f "$PROJECT_DIR/package.json" ]; then
  PROJECT_NAME=$(grep '"name"' "$PROJECT_DIR/package.json" 2>/dev/null | head -1 | sed 's/.*"name": *"\([^"]*\)".*/\1/' || echo "")
fi

# Fallback: nome do diretório
if [ -z "$PROJECT_NAME" ]; then
  PROJECT_NAME=$(basename "$PROJECT_DIR")
fi

# ─── 2. DETECTAR STACK TECNOLÓGICA ────────────────────────────────────────────

TECHS=()

# JavaScript / TypeScript
if [ -f "$PROJECT_DIR/package.json" ]; then
  PACKAGE_MANAGER="npm"
  [ -f "$PROJECT_DIR/yarn.lock" ]        && PACKAGE_MANAGER="yarn"
  [ -f "$PROJECT_DIR/pnpm-lock.yaml" ]   && PACKAGE_MANAGER="pnpm"
  [ -f "$PROJECT_DIR/bun.lockb" ]        && PACKAGE_MANAGER="bun"

  # Detectar frameworks principais
  for fw in next react vue nuxt svelte astro express fastify nestjs; do
    grep -q "\"$fw\"" "$PROJECT_DIR/package.json" 2>/dev/null && TECHS+=("$fw")
  done

  # TypeScript?
  [ -f "$PROJECT_DIR/tsconfig.json" ] && TECHS+=("TypeScript") || TECHS+=("JavaScript")
  PROJECT_TYPE="web"
fi

# Python
if [ -f "$PROJECT_DIR/requirements.txt" ] || [ -f "$PROJECT_DIR/pyproject.toml" ] || [ -f "$PROJECT_DIR/setup.py" ]; then
  TECHS+=("Python")
  [ -f "$PROJECT_DIR/manage.py" ]  && TECHS+=("Django")
  [ -f "$PROJECT_DIR/app.py" ]     && TECHS+=("Flask")
  PROJECT_TYPE="backend"
fi

# Go
[ -f "$PROJECT_DIR/go.mod" ] && TECHS+=("Go") && PROJECT_TYPE="backend"

# Rust
[ -f "$PROJECT_DIR/Cargo.toml" ] && TECHS+=("Rust") && PROJECT_TYPE="backend"

# Docker
[ -f "$PROJECT_DIR/Dockerfile" ] || [ -f "$PROJECT_DIR/docker-compose.yml" ] && TECHS+=("Docker")

# Database
[ -f "$PROJECT_DIR/prisma/schema.prisma" ] && TECHS+=("Prisma")
grep -r "postgres\|postgresql" "$PROJECT_DIR/package.json" "$PROJECT_DIR/requirements.txt" 2>/dev/null | grep -q . && TECHS+=("PostgreSQL")
grep -r "mongodb\|mongoose" "$PROJECT_DIR/package.json" 2>/dev/null | grep -q . && TECHS+=("MongoDB")

TECH_STACK=$(IFS=", "; echo "${TECHS[*]:-Não detectado}")

# ─── 3. DETECTAR FASE DO PROJETO ──────────────────────────────────────────────

PHASE="Início"

if [ -d "$PROJECT_DIR/.git" ]; then
  COMMIT_COUNT=$(git -C "$PROJECT_DIR" rev-list --count HEAD 2>/dev/null || echo "0")
  if   [ "$COMMIT_COUNT" -gt 200 ]; then PHASE="Manutenção/Produção"
  elif [ "$COMMIT_COUNT" -gt 50 ];  then PHASE="Desenvolvimento avançado"
  elif [ "$COMMIT_COUNT" -gt 10 ];  then PHASE="Desenvolvimento"
  elif [ "$COMMIT_COUNT" -gt 0 ];   then PHASE="Início"
  fi
fi

# Tem testes? → fase mais madura
find "$PROJECT_DIR" -name "*.test.*" -o -name "*.spec.*" 2>/dev/null | grep -v node_modules | grep -q . && \
  [ "$PHASE" = "Início" ] && PHASE="Desenvolvimento"

# ─── 4. GIT: ÚLTIMOS COMMITS ──────────────────────────────────────────────────

RECENT_COMMITS=""
if [ -d "$PROJECT_DIR/.git" ]; then
  RECENT_COMMITS=$(git -C "$PROJECT_DIR" log --oneline -10 2>/dev/null || echo "Sem histórico git")
fi

# ─── 5. ARQUIVOS MODIFICADOS RECENTEMENTE ─────────────────────────────────────

RECENT_FILES=""
if [ -d "$PROJECT_DIR/.git" ]; then
  RECENT_FILES=$(git -C "$PROJECT_DIR" diff --name-only HEAD~5 HEAD 2>/dev/null | \
    grep -v node_modules | grep -v ".git" | head -20 || echo "")
fi

# Fallback: arquivos modificados nas últimas 24h
if [ -z "$RECENT_FILES" ]; then
  RECENT_FILES=$(find "$PROJECT_DIR" -newer "$PROJECT_DIR/.git/index" \
    -not -path "*/node_modules/*" -not -path "*/.git/*" \
    -not -path "*/.claude/*" -name "*.ts" -o -name "*.tsx" \
    -o -name "*.js" -o -name "*.py" -o -name "*.go" \
    2>/dev/null | head -20 || echo "")
fi

# ─── 6. DETECTAR TODOs E FIXMEs NO CÓDIGO ────────────────────────────────────

TODOS=""
if [ "$FULL_MODE" = "--full" ]; then
  TODOS=$(grep -rn "TODO\|FIXME\|HACK\|XXX" \
    --include="*.ts" --include="*.tsx" --include="*.js" \
    --include="*.py" --include="*.go" --include="*.rs" \
    "$PROJECT_DIR" 2>/dev/null | \
    grep -v "node_modules" | grep -v ".git" | \
    head -20 || echo "Nenhum TODO/FIXME encontrado")
fi

# ─── 7. ESTRUTURA DE DIRETÓRIOS ───────────────────────────────────────────────

DIR_STRUCTURE=$(find "$PROJECT_DIR" -maxdepth 2 -type d \
  -not -path "*/node_modules*" -not -path "*/.git*" \
  -not -path "*/.claude*" -not -path "*/dist*" \
  -not -path "*/.next*" -not -path "*/build*" \
  2>/dev/null | sed "s|$PROJECT_DIR/||" | sort | head -30 || echo "")

# ─── 8. STATUS GIT ATUAL ──────────────────────────────────────────────────────

GIT_STATUS=""
if [ -d "$PROJECT_DIR/.git" ]; then
  BRANCH=$(git -C "$PROJECT_DIR" branch --show-current 2>/dev/null || echo "main")
  UNCOMMITTED=$(git -C "$PROJECT_DIR" status --porcelain 2>/dev/null | wc -l | tr -d ' ')
  GIT_STATUS="Branch: $BRANCH | Arquivos não commitados: $UNCOMMITTED"
fi

# ─── 9. ESCREVER current_project.md ──────────────────────────────────────────

cat > "$MEMORY_DIR/current_project.md" << EOF
---
name: $PROJECT_NAME
description: Contexto atual do projeto — gerado automaticamente em $TIMESTAMP
type: project
generated: true
---

# Contexto do Projeto: $PROJECT_NAME

## Identificação
- **Nome:** $PROJECT_NAME
- **Tipo:** $PROJECT_TYPE
- **Fase:** $PHASE
- **Stack:** $TECH_STACK
- **Git:** $GIT_STATUS

## Estrutura Principal
\`\`\`
$DIR_STRUCTURE
\`\`\`

## Últimos 10 Commits
\`\`\`
$RECENT_COMMITS
\`\`\`

## Arquivos Modificados Recentemente
\`\`\`
$RECENT_FILES
\`\`\`
EOF

if [ -n "$TODOS" ] && [ "$FULL_MODE" = "--full" ]; then
  cat >> "$MEMORY_DIR/current_project.md" << EOF

## TODOs e FIXMEs no Código
\`\`\`
$TODOS
\`\`\`
EOF
fi

cat >> "$MEMORY_DIR/current_project.md" << EOF

## Instruções para o Claude
- Sempre consulte este arquivo antes de iniciar qualquer tarefa
- Use /save-session ao final de cada sessão de trabalho
- Use /resume-session para retomar uma sessão anterior
- Execute \`bash .claude/tools/update-project-memory.sh\` para atualizar este contexto
- Use /update-docs para sincronizar documentação com o código
EOF

# ─── 10. ESCREVER CONTEXT_SNAPSHOT.md ────────────────────────────────────────

cat > "$MEMORY_DIR/CONTEXT_SNAPSHOT.md" << EOF
# Context Snapshot — $PROJECT_NAME
Gerado em: $TIMESTAMP

## Stack Detectada
$TECH_STACK

## Package Manager
${PACKAGE_MANAGER:-N/A}

## Fase
$PHASE

## Git Status
$GIT_STATUS

## Commits Recentes
$RECENT_COMMITS

## Arquivos Recentes
$RECENT_FILES
EOF

echo "✅ Memória do projeto atualizada!"
echo "   → $MEMORY_DIR/current_project.md"
echo "   → $MEMORY_DIR/CONTEXT_SNAPSHOT.md"
echo ""
echo "📌 Próximo passo: inicie o Claude Code — ele vai carregar este contexto automaticamente."
