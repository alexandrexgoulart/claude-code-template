@echo off
REM =============================================================================
REM SISTEMA DE MEMÓRIA - Claude Code Template
REM Gerenciador de memória para projetos (Windows/PowerShell)
REM =============================================================================

setlocal enabledelayedexpansion

set RED=
set GREEN=
set YELLOW=
set BLUE=
set NC=

REM Cores (funciona no Windows 10+)
for /f "tokens=*" %%a in ('powershell -Command "[Console]::OutputEncoding = [System.Text.Encoding]::UTF8; Write-Host ''"') do set EMPTY=
set GREEN=[92m
set YELLOW=[93m
set BLUE=[94m
set RED=[91m
set NC=[0m

REM Função de help
:show_help
echo.
echo ================================================================================
echo   GERENCIADOR DE MEMORIA - Claude Code Template
echo ================================================================================
echo.
echo Uso: memory-manager.bat [comando]
echo.
echo Comandos:
echo   --init        Inicializar memoria para novo projeto
echo   --update      Atualizar SESSION.md com contexto atual
echo   --show        Mostrar conteudo da memoria atual
echo   --backup      Criar backup da memoria
echo   --restore     Restaurar memoria de backup
echo   --help        Mostrar esta ajuda
echo.
echo Exemplos:
echo   memory-manager.bat --init
echo   memory-manager.bat --show
echo.
exit /b 0

REM Função para inicializar memória
:init_memory
echo Inicializando memoria do projeto...

if exist "SESSION.md" (
    echo SESSION.md ja existe!
    echo Criando backup antes de continuar...
    set BACKUP_NAME=SESSION.backup.%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%.md
    set BACKUP_NAME=!BACKUP_NAME: =0!
    copy SESSION.md "!BACKUP_NAME!"
    echo Backup criado: !BACKUP_NAME!
) else (
    if exist ".claude\memory\templates\SESSION_TEMPLATE.md" (
        copy .claude\memory\templates\SESSION_TEMPLATE.md SESSION.md
        echo SESSION.md criado a partir do template!
    ) else (
        echo # Sessao de Trabalho - [Nome do Projeto] > SESSION.md
        echo. >> SESSION.md
        echo **Ultima atualizacao:** [Data] >> SESSION.md
        echo **Status:** [Em andamento / Concluido / Pausado] >> SESSION.md
        echo. >> SESSION.md
        echo --- >> SESSION.md
        echo. >> SESSION.md
        echo ## Ferramenta Usada >> SESSION.md
        echo. >> SESSION.md
        echo - **Ferramenta:** [OpenCode / Claude Code / Jan.ai] >> SESSION.md
        echo - **Modelo:** [modelo usado] >> SESSION.md
        echo. >> SESSION.md
        echo --- >> SESSION.md
        echo. >> SESSION.md
        echo ## Contexto do Projeto >> SESSION.md
        echo. >> SESSION.md
        echo ### O que e >> SESSION.md
        echo [Descricao breve do projeto] >> SESSION.md
        echo. >> SESSION.md
        echo --- >> SESSION.md
        echo. >> SESSION.md
        echo ## Estrutura de Arquivos >> SESSION.md
        echo. >> SESSION.md
        echo [Lista de arquivos principais] >> SESSION.md
        echo. >> SESSION.md
        echo --- >> SESSION.md
        echo. >> SESSION.md
        echo ## Funcionalidades Implementadas >> SESSION.md
        echo. >> SESSION.md
        echo [O que ja foi feito] >> SESSION.md
        echo. >> SESSION.md
        echo --- >> SESSION.md
        echo. >> SESSION.md
        echo ## Problemas Conhecidos >> SESSION.md
        echo. >> SESSION.md
        echo [Issues abertos] >> SESSION.md
        echo. >> SESSION.md
        echo --- >> SESSION.md
        echo. >> SESSION.md
        echo ## Tarefas Proximas >> SESSION.md
        echo. >> SESSION.md
        echo [O que falta fazer] >> SESSION.md
        echo. >> SESSION.md
        echo --- >> SESSION.md
        echo. >> SESSION.md
        echo ## Observacoes Importantes >> SESSION.md
        echo. >> SESSION.md
        echo [Notas importantes] >> SESSION.md
        echo. >> SESSION.md
        echo --- >> SESSION.md
        echo. >> SESSION.md
        echo *Este arquivo e atualizado automaticamente apos cada sessao de trabalho.* >> SESSION.md
        echo SESSION.md criado!
    )
)

echo.
echo [OK] Memoria inicializada com sucesso!
echo.
echo Provavel proximo passo: Inicie uma sessao com o Claude/OpenCode
exit /b 0

REM Função para mostrar memória
:show_memory
if exist "SESSION.md" (
    echo.
    echo ================================================================================
    echo   CONTEUDO DA MEMORIA
    echo ================================================================================
    echo.
    type SESSION.md
) else (
    echo.
    echo [ERRO] SESSION.md nao encontrado!
    echo Execute: memory-manager.bat --init
    echo.
)
exit /b 0

REM Função para atualizar memória
:update_memory
if exist "SESSION.md" (
    echo Atualizando memoria...
    echo.
    echo Para atualizar a memoria, edite o arquivo SESSION.md manualmente.
    echo.
    echo Campos sugeridos para atualizacao:
    echo   - Ultima atualizacao (data)
    echo   - Status do projeto
    echo   - Novas funcionalidades implementadas
    echo   - Problemas resolvidos
    echo   - Novas tarefas proximas
    echo.
    notepad SESSION.md
) else (
    echo.
    echo [ERRO] SESSION.md nao encontrado!
    echo Execute primeiro: memory-manager.bat --init
    echo.
)
exit /b 0

REM Função para criar backup
:backup_memory
if exist "SESSION.md" (
    set BACKUP_NAME=SESSION.backup.%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%.md
    set BACKUP_NAME=!BACKUP_NAME: =0!
    copy SESSION.md "!BACKUP_NAME!"
    echo Backup criado: !BACKUP_NAME!
) else (
    echo [ERRO] Nenhuma memoria para fazer backup!
)
exit /b 0

REM Função para restaurar backup
:restore_memory
for /f "tokens=*" %%i in ('dir /b /o-d SESSION.backup.*.md 2^>nul') do set LATEST=%%i
if defined LATEST (
    echo Ultimo backup encontrado: !LATEST!
    echo Restaurando...
    copy "!LATEST!" SESSION.md
    echo Memoria restaurada!
) else (
    echo [ERRO] Nenhum backup encontrado!
)
exit /b 0

REM =============================================================================
REM MAIN
REM =============================================================================

if "%1"=="" goto show_help
if "%1"=="--help" goto show_help
if "%1"=="-h" goto show_help
if "%1"=="--init" goto init_memory
if "%1"=="--update" goto update_memory
if "%1"=="--show" goto show_memory
if "%1"=="--backup" goto backup_memory
if "%1"=="--restore" goto restore_memory

echo [ERRO] Comando desconhecido: %1
echo Execute: memory-manager.bat --help
exit /b 1