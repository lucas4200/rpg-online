# 32: Implementar sistema de NPCs autônomos (bots) que usam as mesmas regras de movimento, combate, inventário, loot e progressão dos jogadores sempre que possível

**What to build:** NPC é uma entidade controlada pelo servidor com um componente de IA (behavior tree ou utility AI). Pode: atacar monstros, coletar recursos, usar equipamentos, trocar com jogadores, seguir rotas. Population manager ajusta número de NPCs ativos com base na quantidade de jogadores reais (mais jogadores = menos bots).

**Blocked by:** 14,15,16,17,18,20,21,30

**Status:** ready-for-agent

- [ ] Acceptance criterion 1: NPC aparece no mundo e se move usando mesmo sistema de velocidade do jogador
- [ ] Acceptance criterion 2: NPC pode atacar monstro e receber XP/loot conforme regras de jogador
- [ ] Acceptance criterion 3: NPC pode pegar item do chão e colocá-lo no inventario
- [ ] Acceptance criterion 4: NPC pode iniciar trade com jogador se tiver algo para oferecer
- [ ] Acceptance criterion 5: Quando número de jogadores online aumenta, número de NPCs ativos diminui (limite máximo configurado)
- [ ] Acceptance criterion 6: Quando número de jogadores diminui, número de NPCs aumenta até o limite máximo

