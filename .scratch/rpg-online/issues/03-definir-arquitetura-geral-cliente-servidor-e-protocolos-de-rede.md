# 03: Definir arquitetura geral cliente-servidor e protocolos de rede

**What to build:** Arquitetura de alto nível desenhada em ARCHITECTURE.md: cliente Godot ↔ servidor C++ via TCP/WebSocket, mensagens protobuf ou JSON, autoridade do servidor, predição do cliente.

**Blocked by:** 01,02

**Status:** done

- [x] Acceptance criterion 1: Documento existe e descreve camadas (rede, lógica de jogo, persistência)
- [x] Acceptance criterion 2: Diagramas de sequência para login e movimento básico estão presentes

## Diagrama de Sequência: Login

```mermaid
sequenceDiagram
    participant C as Cliente
    participant S as Servidor
    participant DB as Banco de Dados

    C->>S: Conectar (TCP)
    C->>S: LoginRequest(username, password_hash)
    S->>DB: Verificar credenciais
    DB-->>S: Resultado (válido/inválido)
    alt credenciais válidas
        S->>S: Gerar token de sessão
        S->>C: LoginResponse(sucesso, token, dados do personagem)
        S->>C: Estado inicial do mundo (entities visíveis)
    else credenciais inválidas
        S->>C: LoginResponse(falha, mensagem de erro)
    end
```

## Diagrama de Sequência: Movimento Básico (com predição)

```mermaid
sequenceDiagram
    participant C as Cliente
    participant S as Servidor
    participant O as Outros Clientes (na vizinhança)

    Note over C,O: Estado atual: personagem em (x0, y0)
    C->>C: Processar entrada (tecla W para cima)
    C->>C: Aplicar movimento local (predição): (x0, y0+Δy)
    C->>S: PlayerMoveRequest(nova_posição, timestamp)
    S->>S: Processar movimento (verificar colisões, limites)
    S->>S: Atualizar posição autoritativa
    alt movimento válido
        S->>C: PlayerMoveResponse(sucesso, posição autoritativa)
        S->>O: EntityUpdate(ID do personagem, nova posição)
        O->>O: Interpolar personagem remoto
    else movimento inválido (colisão, fora dos limites)
        S->>C: PlayerMoveResponse(falha, posição autoritativa)
        C->>C: Corrigir posição para a autoritativa (reconciliação)
    end
```
