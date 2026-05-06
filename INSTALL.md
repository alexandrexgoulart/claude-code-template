# Quick Install Guide

## Instalar em Novo Projeto (Windows)

### Opção 1: Script Automático (RECOMENDADO)

```powershell
# Clone e instale automatico
git clone https://github.com/alexandrexgoulart/claude-code-template.git novo-projeto
cd novo-projeto
.\scripts\install.ps1
```

### Opção 2: Manual

```powershell
# Clone
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp

# COPIE TODOS OS ARQUIVOS (nao apenas .claude!)
Copy-Item -Path "temp\*" -Destination "." -Recurse -Force

# Copie arquivos ocultos
Copy-Item -Path "temp\.gitignore" -Destination "." -Force

# Limpe
Remove-Item -Recurse -Force temp

# Inicialize memoria
.\scripts\memory-manager.bat --init
```

## Instalar em Novo Projeto (Linux/Mac)

```bash
git clone https://github.com/alexandrexgoulart/claude-code-template.git temp
cp -r temp/* .
cp -r temp/.* . 2>/dev/null || true
rm -rf temp
bash scripts/memory-manager.sh --init
```

## Problemas?

### Clone Incompleto
```powershell
git clone --depth 1 https://github.com/alexandrexgoulart/claude-code-template.git temp
cd temp
git fetch --unshallow
Get-ChildItem -Name
```

---

Para documentação completa, veja `docs/README.md`