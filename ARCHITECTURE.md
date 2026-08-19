# Arquitetura Geral Cliente-Servidor

## Visão Geral

O RPG Online segue uma arquitetura cliente-servidor tradicional, onde o servidor é a autoridade máxima sobre o estado do mundo do jogo, e os clientes são responsáveis pela renderização, entrada do usuário e predição local para melhorar a experiência de jogo.

## Componentes Principais

### Servidor (C++)

- Linguagem: C++17 ou superior
- Responsabilidades:
  - Manter o estado autoritativo do mundo (posições de jogadores, NPCs, itens, missão, etc.)
  - Processar lógica de jogo (combate, movimento, interações)
  - Gerenciar conexões de clientes (autenticação, sessões)
  - Persistir dados no banco de dados PostgreSQL
  - Opicionalmente, usar Redis para caching e filas de mensagens
- Comunicação:
  - TCP/IP para conexões confiáveis e ordenadas
  - Mensagens serializadas usando Protocol Buffers (protobuf) para eficiência e compatibilidade futura
  - Possível suporte a WebSocket para clientes web (futuro)
- Estrutura de código:
  - `src/net/` - camada de rede (aceitação de conexões, framing, dispatch)
  - `src/game/` - lógica de jogo (entidades, sistemas, componentes)
  - `src/db/` - camada de acesso ao banco de dados
  - `src/main.cpp` - ponto de entrada

### Cliente (Godot Engine)

- Engine: Godot 4.x (2D)
- Linguagem: GDScript (com possibilidade de C# ou C++ via GDNative para módulos de performance)
- Responsabilidades:
  - Renderização 2D top-down
  - Captura de entrada do usuário (teclado, mouse, controle)
  - Predição do lado do cliente para movimento e ações imediatas
  - Interpolação e reconciliação com o estado autoritativo do servidor
  - Interface do usuário (menus, HUD, chat, inventário)
  - Localização e internacionalização (PT-BR inicialmente)
- Comunicação:
  - TCP/IP ou WebSocket para conectar ao servidor
  - Mesmo formato de mensagem (protobuf) usado pelo servidor
  - Estrutura de cenas:
    - `scenes/` - cenas reutilizáveis (HUD, jogadores, NPCs, tiles)
    - `scripts/` - scripts GDScript para lógica de cliente
    - `autoload/` - scripts globais (rede, gerenciador de estado, utils)
    - `assets/` - sprites, tilesets, fontes, sons

## Protocolos de Comunicação

### Formato de Mensagem

- Protocol Buffers (protobuf) definido em `proto/message.proto`
- Exemplos de mensagens:
  - `LoginRequest`, `LoginResponse`
  - `PlayerMoveRequest`, `PlayerMoveResponse`
  - `EntityUpdate` (broadcast do estado de entidades relevantes)
  - `ChatMessage`
  - `ItemActionRequest`, `ItemActionResponse`

### Camada de Rede

- Cada conexão de cliente é tratada em uma thread separada ou usando async I/O (Boost.Asio ou similar)
- Mensagens são delimitadas por comprimento (varint) seguido pelos dados protobuf
- Heartbeat periódico para detecção de desconexões

### Segurança

- Autenticação via token JWT ou sessão segura após login inicial
- Todas as comunicações após autenticação devem ser consideradas confiáveis apenas se originadas do servidor autoritativo
- Validação rigorosa de todas as entradas do cliente no servidor (nunca confie no cliente)

## Fluxos de Interação Principais

### Login

1. Cliente conecta ao servidor TCP
2. Cliente envia `LoginRequest (username, password hash)
3. Servidor verifica credenciais no banco de dados
4. Servidor responde com LoginResponse (sucesso, token de sessão, dados iniciais do personagem)
5. Cliente armazena token e inicia atualização de estado

### Movimento Básico (com predição)

1. Cliente recebe entrada de movimento (ex: tecla W para cima)
2. Cliente aplica movimento imediatamente ao personagem local (predição)
3. Cliente envia PlayerMoveRequest ao servidor com nova posição desejada e timestamp
4. Servidor processa o movimento, verifica colisões e limites, atualiza posição autoritativa
5. Servidor transmite EntityUpdate para todos os clientes na vizinhança (incluindo o remetente)
6. Cliente corrige posição do personagem se houver divergência (reconciliação)
7. Cliente interpola entre posições conhecidas para movimento suave

### Chat

1. Cliente envia ChatMessage com texto
2. Servidor valida (filtro de profanidade, rate limit)
3. Servidor transmite ChatMessage para todos os jogadores no mesmo mapa ou canal
4. Clientes recebem e exibem a mensagem em sua interface de chat

## Persistência

- Banco de dados PostgreSQL armazena:
  - Contas de usuários (email, hash de senha, data de criação)
  - Personagens (atributos, posição, inventário, progresso)
  - Mundo (estado de zonas, NPCs, itens no chão, etc.)
  - Logs de auditoria (opcional)
- ORM ou queries diretas usando libpq ou biblioteca moderna (como soci)
- Migrações de esquema gerenciadas por scripts SQL

## Escalabilidade

- Arquitetura pronta para particionamento de zona (sharding por mapa)
- Servidor pode ser escalado verticalmente (mais CPU/RAM) ou horizontalmente (múltiplos servidores de zona atrás de um balancer de login)
- Uso de filas (Redis Pub/Sub ou RabbitMQ) para comunicação entre servidores de zona futura

## Tecnologias Consideradas (futuro)

- Protobuf para mensagens binárias eficientes
- Boost.Asio ou std::network (C++23) para I/O assíncrono
- Godot 4.x com renderizador Vulkan para melhor desempenho
- PostgreSQL com conexões em pool (pgBouncer ou similar)
- Redis para caching de sessões e leaderboards
- Docker para containerização de servidores
- GitHub Actions para CI/CD (build, testes, deploy)

