# 11: Implementar sistema de atributos básicos (força, destreza, inteligência, vitalidade, speed) e pontos por nível

**What to build:** Cada nível concede N pontos de atributo (valor a ser definido posteriormente – placeholder). Endpoint /characters/{id}/attributes permite distribuir pontos (PATCH) respeitando o total disponível. Atributos afetam cálculo de dano, defesa, regen (fórmulas placeholder).

**Blocked by:** 10

**Status:** ready-for-agent

- [ ] Acceptance criterion 1: Personagem começa com 0 pontos disponíveis no nível 1
- [ ] Acceptance criterion 2: Após subir de nível, pontos disponíveis aumentam conforme config
- [ ] Acceptance criterion 3: Distribuir pontos atualiza os campos de atributo e reduz pontos disponível
- [ ] Acceptance criterion 4: Não permite exceder o total disponível

