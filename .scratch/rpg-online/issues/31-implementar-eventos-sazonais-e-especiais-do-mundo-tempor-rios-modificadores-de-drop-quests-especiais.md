# 31: Implementar eventos sazonais e especiais do mundo (temporários, modificadores de drop, quests especiais)

**What to build:** Tabela world_events com id, name, start_time, end_time, modifiers (ex: drop_rate_multiplier, special_quest_id). Servidor aplica modificadores enquanto evento ativo.

**Blocked by:** 30

**Status:** ready-for-agent

- [ ] Acceptance criterion 1: Durante evento, modificadores estão ativos (ex: taxa de drop de item raro aumenta 2x)
- [ ] Acceptance criterion 2: Após término, modificadores voltam ao normal
- [ ] Acceptance criterion 3: Eventos não se sobrepõem de forma conflitante (ou há sistema de prioridade)

