# Guia de Configuração do Ambiente de Desenvolvimento

Este documento descreve como configurar o ambiente de desenvolvimento para o projeto RPG Online.

## Pré-requisitos

- Sistema operacional: Windows 10/11 (64-bit)
- Conexão com internet para download das ferramentas

## Ferramentas necessárias

### 1. Godot Engine (versão 4.2 ou superior)
- Download: https://godotengine.org/download
- Após instalação, adicionar o diretório do Godot ao PATH ou usar o caminho absoluto ao executar.

### 2. Compilador C++
Recomendamos o uso do Microsoft Visual Studio Build Tools (inclui o compilador cl.exe) ou o Visual Studio Community.
- Download do Build Tools: https://visualstudio.microsoft.com/visual-cpp-build-tools/
- Durante a instalação, selecionar a carga de trabalho "Desktop development with C++".

### 3. PostgreSQL (versão 15 ou superior)
- Download: https://www.postgresql.org/download/windows/
- Durante a instalação, definir uma senha para o usuário `postgres` (anotar para uso posterior).
- Adicionar o diretório `bin` do PostgreSQL ao PATH (ex: `C:\Program Files\PostgreSQL\15\bin`).

### 4. Redis (opcional, para caching futuro)
- Download: https://github.com/microsoftarchive/redis/releases (versão Windows)
- Extrair e executar `redis-server.exe` como serviço ou em segundo plano.
- Alternativamente, usar o instalação via Chocolatey: `choco install redis-64`.

### 5. Git (já deve estar instalado se você clonou o repositório)
- Verificar: `git --version`

### 6. Node.js (para ferramentas de frontend e scripts)
- Download: https://nodejs.org/
- Versão LTS recomendada.

## Verificação da instalação

Após instalar cada ferramenta, abra um novo terminal (PowerShell ou CMD) e execute:

```powershell
# Godot
godot --version

# Compilador C++ (cl.exe)
cl

# PostgreSQL
psql --version

# Redis
redis-server --version

# Git
git --version

# Node.js
node --version
npm --version
```

Todos os comandos devem retornar informações de versão sem erros.

## Scripts de setup automatizado

O repositório inclui scripts para ajudar na verificação e configuração inicial:

- `scripts/setup-dev.ps1`: Script PowerShell que verifica a presença das ferramentas e opcionalmente baixa/instala alguns componentes (via Chocolatey, se disponível).
- `scripts/setup-dev.sh`: Equivalente para ambientes Unix-like (não testado neste projeto).

### Uso do script PowerShell

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\setup-dev.ps1
```

O script fará:
1. Verificar se cada ferramenta está disponível no PATH.
2. Informar versões encontradas.
3. Opicionalmente, se Chocolatey estiver instalado, oferecer instalar pacotes faltantes.
4. Gerar um arquivo `.env` com variáveis de ambiente sugeridas para o projeto (ex: strings de conexão ao PostgreSQL).

## Configuração do Banco de Dados

Após instalar o PostgreSQL:

1. Abra o SQL Shell (psql) como usuário `postgres`.
2. Execute:
   ```sql
   CREATE DATABASE rpg_online;
   CREATE USER rpg_user WITH PASSWORD 'sua_senha_segura';
   GRANT ALL PRIVILEGES ON DATABASE rpg_online TO rpg_user;
   \q
   ```
3. Copie as credenciais para o arquivo `.env` (gerado pelo script ou criado manualmente):
   ```
   POSTGRES_HOST=localhost
   POSTGRES_PORT=5432
   POSTGRES_DB=rpg_online
   POSTGRES_USER=rpg_user
   POSTGRES_PASSWORD=sua_senha_segura
   ```

## Configuração do Godot

- Ao abrir o projeto no Godot, certifique-se de que o ponto de abertura seja a pasta raiz do repositório.
- O projeto Godot deve estar configurado para usar o renderer compatível com seu hardware (OpenGL ES 3.0 ou Vulkan).
- As cenas iniciais estão em `client/` (a ser criado nas próximas etapas).

## Próximos passos

Após configurar o ambiente, proceeda para o ticket 03: "Definir arquitetura geral cliente-servidor e protocolos de rede".

