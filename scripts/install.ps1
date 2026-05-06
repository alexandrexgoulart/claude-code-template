# =============================================================================
# INSTALL.PWS1 - Script de Instalação do Claude Code Template
# Execute este script em um NOVO PROJETO para configurar 100%
# =============================================================================

param(
    [string]$TemplateUrl = "https://github.com/alexandrexgoulart/claude-code-template.git",
    [string]$ProjectName = ""
)

$ErrorActionPreference = "Stop"

function Write-Status($Message, $Type = "info") {
    $colors = @{
        "info"    = "Cyan"
        "success" = "Green"
        "warning" = "Yellow"
        "error"   = "Red"
    }
    Write-Host "[$Type] $Message" -ForegroundColor $colors[$Type]
}

function Install-Template {
    $tempDir = "temp-claude-template"

    Write-Status "=== INSTALANDO CLAUDE CODE TEMPLATE ===" "info"
    Write-Status "Clonando template..." "info"

    # Remover directorio temporario se existir
    if (Test-Path $tempDir) {
        Remove-Item -Path $tempDir -Recurse -Force
    }

    # Clonar repositorio
    git clone $TemplateUrl $tempDir

    if (-not $?) {
        Write-Status "Erro ao clonar repositorio!" "error"
        exit 1
    }

    Write-Status "Copiando arquivos..." "info"

    # Copiar TODOS os arquivos (NAO apenas .claude)
    Copy-Item -Path "$tempDir\*" -Destination "." -Recurse -Force

    # Copiar arquivos ocultos
    if (Test-Path "$tempDir\.gitignore") {
        Copy-Item -Path "$tempDir\.gitignore" -Destination "." -Force
    }

    if (Test-Path "$tempDir\.claude") {
        Copy-Item -Path "$tempDir\.claude" -Destination "." -Recurse -Force
    }

    Write-Status "Limpando..." "info"

    # Remover directorio temporario
    Remove-Item -Path $tempDir -Recurse -Force

    # Inicializar memoria
    Write-Status "Inicializando sistema de memoria..." "info"
    if (Test-Path "scripts\memory-manager.bat") {
        .\scripts\memory-manager.bat --init
    }

    Write-Status ""
    Write-Status "=== INSTALACAO CONCLUIDA ===" "success"
    Write-Status ""
    Write-Status "Proximo passo:" "info"
    Write-Status "1. Abra este projeto com OpenCode ou Claude Code" "info"
    Write-Status "2. O sistema carregara automaticamente o SESSION.md" "info"
    Write-Status "3. Comece a trabalhar!" "info"
    Write-Status ""
}

# Verificar se git esta disponivel
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Status "Git nao encontrado! Instale o Git primeiro." "error"
    exit 1
}

# Executar instalacao
Install-Template