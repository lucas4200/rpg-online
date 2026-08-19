# CONTEXT.md - Glossary and Shared Language for RPG Online Project

## Core Concepts

**RPG Online**: Um jogo de RPG online gratuito, 2D top-down, voltado para jovens adultos (16-30) com foco em exploração, combate tático e progressão de personagem. Modelo de negócio: gratuito com itens cosméticos e expansões de conteúdo (não pay-to-win).

**Perspectiva Visual**: 2D top-down (visão de cima, estilo clássico de RPG online) com identidade visual própria e moderna, sem copiar Tibia.

**Público-alvo**: Jovens adultos entre 16 e 30 anos que apreciam RPG clássico com forte ênfase em exploração de mundo, combate, progressão de personagem e descoberta do mundo.

**Modelo de Negócio**: Gratuito para jogar (free-to-play) com monetização através de:
- Itens cosméticos (skins, visual effects, emotes)
- Expansões de conteúdo (novas zonas, quests, histórias)
- Nenhum elemento pay-to-win que afete o balanceamento de combate ou progressão.

**Escopo Inicial do Mundo**: Mundo de tamanho controlado com aproximadamente 3 zonas/biomas iniciais, mas com arquitetura preparada para expansão posterior:
1. Floresta inicial (zona de início para novos jogadores)
2. Planície (zona intermediária com recursos e desafios moderados)
3. Masmorra inicial (primeira instância/grupo para aprender mecânicas de grupo)

**Sistema de Combate**: Combate em tempo real (sem pausa), desenvolvido desde o início para multiplayer online. Deve envolver posicionamento, movimentação, habilidades, gerenciamento de recursos e decisões táticas durante o combate.

**Progressão de Velocidade**: A velocidade do personagem faz parte da progressão. Conforme o personagem evolui de nível, ele deve ficar progressivamente mais rápido. O sistema de Speed é uma característica importante do RPG; sua fórmula, limites e impacto no PvP/PvE devem ser definidos durante o Grill para manter o jogo equilibrado.

## Decisões Técnicas

**Arquitetura do Cliente**: Godot Engine. Cliente próprio 2D top-down com qualidade visual alta, boa performance e possibilidade de criar mapas, animações, efeitos, interface e sistemas de gameplay de forma eficiente. Arquitetura preparada para futura evolução sem ficar preso a limitações da engine.

**Arquitetura do Servidor**: C++. Priorizando performance, controle, estabilidade e capacidade de escalar o multiplayer real-time. Arquitetura bem organizada e segura, preparada para muitos jogadores simultâneos e para expansão futura do mundo e dos sistemas.

**Banco de Dados**: PostgreSQL como banco de dados principal para contas, personagens, inventário, economia, progresso e dados persistentes do mundo. Redis pode ser utilizado posteriormente como complemento para cache, sessões, filas ou dados temporários, caso a arquitetura realmente precise.

**Sistema de Contas**: Sistema próprio com email e senha, usando boas práticas de segurança (hash forte, salt único, limite de tentativas), recuperação de conta via email, e arquitetura preparada para futuramente adicionar login por Google, Discord e Steam via OAuth. O jogo deve funcionar normalmente sem depender dessas plataformas.

**Classes de Personagem**: A definição das classes será feita após estabelecermos o sistema de atributos, progressão, combate e filosofia geral do personagem. O objetivo é criar classes realmente únicas para o nosso RPG, evitando simplesmente copiar arquétipos genéricos de outros jogos (Guerreiro, Mago, Arqueiro, Clérigo).

## Sistema de Atributos e Progressão (em definição)

**Atributos Básicos**: O personagem terá um conjunto de atributos próprios (não cópia de Tibia ou outros RPGs). Força, Destreza, Inteligência, Vitalidade e Speed são considerados como base, mas será investigado quais atributos são realmente necessários e como devem se relacionar antes de fechar a lista definitiva. Além dos atributos, o personagem possui **Life/HP** e **Mana** como recursos fundamentais que aumentam com a progressão.

**Mecânicas de Progressão**: Sistema híbrido que combina:
- Evolução por níveis com aumento natural de poder conforme sobe de nível
- Recebimento de pontos de atributo para distribuir
- Desbloqueio de novas habilidades por nível
- Sistemas mais profundos como talentos, especializações ou habilidades que evoluem com uso ou escolha do jogador
- O jogador deve sentir a evolução do personagem: subir de nível aumenta poder de combate, HP máximo, Mana máxima, atributos e outros aspectos da progressão, dependendo do arquétipo e das escolhas do jogador
- Não quer progressão linear simples; quer decisões e especializações que permitam construir personagens diferentes

**Recursos de Combate**: 
- **Mana** como recurso fundamental, mas não obrigatoriamente utilizado da mesma maneira por todos os arquétipos
- Diferentes arquétipos podem possuir recursos ou mecânicas próprias além de Mana, dependendo do estilo de jogo (ex: energia, fúria, fé, etc.)
- Recursos devem ter identidade e influenciar diretamente o combate
- HP e Mana possuem sistemas de regeneração e podem ser afetados por atributos, equipamentos, habilidades, buffs e debuffs

**Progressão de Speed**:
- Speed é uma característica importante da progressão do personagem
- Conforme o personagem sobe de nível, sua velocidade de movimento aumenta progressivamente (personagem de nível alto perceptivelmente mais rápido que iniciante)
- Speed influencia movimentação pelo mundo, exploração, posicionamento e combate em tempo real
- Além da progressão natural por nível, Speed pode ser modificada por atributos, equipamentos, buffs, debuffs e habilidades
- Sistema precisa ser cuidadosamente balanceado para não quebrar PvP, PvE ou exploração

## Conteúdo, Social e Longo Prazo (em definição)

**Sistema de Quests e Narrativa**:
- Mistura de narrativa principal, quests secundárias, exploração, eventos e narrativa ambiental
- Cada região possui sua própria história conectada a uma narrativa maior do mundo
- História entregue através de diálogos com NPCs, livros/documentos encontrados, descobertas durante exploração, eventos e outras formas
- Não se limita a quests simples de "mate X" ou "pegue X"; inclui exploração, investigação, escolhas, puzzles, descoberta de lugares e situações
- Sistema deve permitir conteúdo simples e quests mais complexas (estrutura a ser definida)

**Sistemas Sociais**:
- Guildas, grupos/parties, chat, amigos
- Comércio entre jogadores e mercado de jogadores
- PvP (a definir onde e como funcionará, zonas protegidas/risco, regras e consequências)
- Atividades e conteúdos cooperativos
- Sistemas que incentivem interação entre jogadores
- Guildas com potencial para evoluir (banco, territórios, missões, rankings, etc.)

**Modelo de Expansão e Conteúdo Pós-Lançamento**:
- Arquitetura preparada desde o início para expansão
- Após lançamento: novas regiões, monstros, bosses, quests, itens, habilidades, sistemas, eventos
- Eventos sazonais e especiais do mundo
- Arquitetura de conteúdo que permite adicionar novo conteúdo sem reescrever partes fundamentais
- Frequência e tipos de expansão a serem definidos (expansões maiores, eventos menores, atualizações de qualidade de vida)

**Sistema de Crafting e Melhoria de Equipamentos**:
- Crafting relevante para economia e progressão
- Jogadores coletam materiais e utilizam profissões/sistemas de crafting para produzir itens, consumíveis e equipamentos
- Sistemas de melhoria de equipamentos (não cópia de outros MMORPGs)
- Possibilidades: slots, encantamentos, atributos especiais, upgrades, materiais raros (a definir)
- Cuidado para que crafting não torne loot do mundo inútil; loot, crafting e economia devem funcionar juntos

**Políticas e Moderação**:
- Sistema de moderação preparado desde o início
- Suporte para denúncias dentro do jogo, ferramentas administrativas, logs importantes do servidor
- Proteção contra exploits, cheats e bots externos, filtros de chat, sistema de punições progressivas
- Servidor projetado pensando em segurança, auditoria e investigação de comportamentos suspeitos
- Regras de conduta claras com diferentes níveis de punição conforme gravidade

**NPCs Autônomos / Bots do Mundo**:
- Sistema importante de NPCs autônomos controlados pelo servidor
- Quando poucos jogadores online, mundo não parece vazio; servidor controla personagens autônomos que participam organicamente
- Esses NPCs podem: caçar monstros e evoluir, explorar mundo e caves, formar grupos, ocupar/disputar áreas de caça, coletar recursos, utilizar equipamentos, comprar/vender itens, interagir com NPCs, realizar atividades do mundo, entrar em conflitos ou atacar jogadores quando faz sentido para personalidade/facção/região/regras de PvP
- Devem possuir diferentes personalidades, níveis, equipamentos, objetivos e estilos de combate
- Devem parecer personagens reais do mundo, não criaturas aleatórias
- Arquitetura do servidor preparada desde o início para esse sistema
- NPCs devem utilizar mesmas regras fundamentais dos jogadores para movimentação, combate, habilidades, inventário, loot e progressão (evitar segunda versão das regras)
- IA configurável, comportamentos diferentes, objetivos próprios
- Quantidade de NPCs deve aumentar/diminuir conforme população real de jogadores (mais jogadores = menos bots artificiais)
- A definir posteriormente: arquitetura da IA, comportamento, tomada de decisões, spawning/despawning, progressão, facções, interação com jogadores, PvP, impacto na economia, custo CPU/memória, quantidade simultânea, evitando previsibilidade

## Decisions Pending
- [ ] Lista final de atributos e fórmulas de como afetam dano, defesa, cura, etc.
- [ ] Sistema exato de progressão por nível: quantos pontos de atributo por nível, como desbloqueio de habilidades funciona
- [ ] Detalhamento dos sistemas de talentos/especializações/habilidades que evoluem
- [ ] Definição de recursos únicos por arquétipo/classe (além de Mana) e como são gerenciados
- [ ] Fórmula exata de aumento de Speed por nível, limites máximos, e fatores modificadores (equipamentos, buffs, etc.)
- [ ] Sistema de raridade de loot (quantidade de tiers, nomes, chances, impacto no valor)
- [ ] Mecânicas de crafting e melhoria de equipamentos
- [ ] Detalhes da economia entre jogadores: taxas, sistemas de troca, prévenção de exploits
- [ ] Sistema de quests e narrativa (estrutura, tipos de quests, entrega de história, equilíbrio entre simples e complexo)
- [ ] Sistemas sociais (detalhes de guildas, partidos, chat, comércio, mercado, PvP, zonas, regras)
- [ ] Modelo de expansão de conteúdo pós-lançamento (frequência, tipos de expansão, eventos sazonais, atualizações)
- [ ] Sistema de crafting detalhado (materiais, profissões, riscos, melhorias, slots, encantos)
- [ ] Políticas e moderação (sistema de relatos, ferramentas, logs, regras de conduta, punições)
- [ ] Sistema de NPCs autônomos (arquitetura da IA, comportamentos, facções, progressão, interação, impacto na economia, balanceamento de quantidade)