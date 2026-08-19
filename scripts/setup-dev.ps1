# setup-dev.ps1
# Script to verify development environment for RPG Online project

Write-Host "=== Verificando ambiente de desenvolvimento para RPG Online ===" -ForegroundColor Cyan

# Função para verificar se um comando existe e obter versão
function Check-Command {
    param([string]$Name, [string]$VersionArg = '--version')
    if (Get-Command $Name -ErrorAction SilentlyContinue) {
        try {
            $version = & $Name $VersionArg 2>&1 | Select-Object -First 1
            Write-Host "✓ $Name encontrado: $version" -ForegroundColor Green
            return $true
        } catch {
            Write-Host "✗ $Name encontrado porém falha ao obter versão: $_" -ForegroundColor Red
            return $false
        }
    } else {
        Write-Host "✗ $Name NÃO encontrado no PATH" -ForegroundColor Yellow
        return $false
    }
}

# Lista de ferramentas para verificar
$tools = @(
    @{ Name = 'godot'; VersionArg = '--version' },
    @{ Name = 'cl'; VersionArg = '' }, # cl.exe não tem --version padrão, apenas mostra uso
    @{ Name = 'psql'; VersionArg = '--version' },
    @{ Name = 'redis-server'; VersionArg = '--version' },
    @{ Name = 'git'; VersionArg = '--version' },
    @{ Name = 'node'; VersionArg = '--version' },
    @{ Name = 'npm'; VersionArg = '--version' }
)

Write-Host ""
Write-Host "Verificando ferramentas necessárias:" -ForegroundColor Cyan
$allGood = $true
foreach ($tool in $tools) {
    if (-not (Check-Command $tool.Name $tool.VersionArg)) {
        $allGood = $false
    }
}

Write-Host ""
if ($allGood) {
    Write-Host "=== Todas as ferramentas estão disponíveis! ===" -ForegroundColor Green
} else {
    Write-Host "=== Algumas ferramentas estão faltando. Por favor, instale-as e execute novamente. ===" -ForegroundColor Red
}

# Verificar variáveis de ambiente sugeridas
Write-Host ""
Write-Host "Verificando possíveis arquivos de configuração:" -ForegroundColor Cyan
if (Test-Path '.env') {
    Write-Host "✓ Arquivo .env encontrado." -ForegroundColor Green
} else {
    Write-Host "⚠ Arquivo .env não encontrado. Considere criá-lo com as variáveis de conexão ao PostgreSQL." -ForegroundColor Yellow
}

# Informar próximos passos
Write-Host ""
Write-Host "Próximos passos:" -ForegroundColor Cyan
Write-Host "1. Instale quaisquer ferramentas faltantes."
Write-Host "2. Configure o banco de dados PostgreSQL (criar banco e usuário)."
Write-Host "3. Copie as credenciais para .env (ex: POSTGRES_HOST=localhost, etc.)."
Write-Host "4. Execute este script novamente para verificar."
Write-Host "5. Prossiga para o ticket 03: Definir arquitetura geral cliente-servidor e protocolos de rede."
