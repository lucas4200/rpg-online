# 13: Implementar sistema de recursos Life/HP e Mana (regen, consumo, limite máximo)

**What to build:** Atributos hp_current, mana_current na tabela characters. Regen base por segundo (ex: hp_regen = vitality * 0.5). Endpoint /characters/{id}/regen aplica regen a cada tick do servidor.

**Blocked by:** 12

**Status:** ready-for-agent

- [ ] Acceptance criterion 1: HP e Mana nunca excedem os máximos
- [ ] Acceptance criterion 2: Regen aumenta com o tempo quando não em combate
- [ ] Acceptance criterion 3: Consumo de mana ao usar habilidade reduz mana_current corretamente

