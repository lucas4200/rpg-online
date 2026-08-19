# 10: Implementar sistema de experiência e nivelamento básico (tabela de XP por nível)

**What to build:** Tabela xp_levels com level, xp_required. Ao ganhar XP suficiente, nível aumenta, atributos base aumentam (conforme fórmulas a serem definidas posteriormente – placeholder). Endpoint /characters/{id}/xp adiciona XP e atualiza nível se aplicável.

**Blocked by:** 09

**Status:** ready-for-agent

- [ ] Acceptance criterion 1: Tabela xp_levels preenchida com níveis 1-50 (exemplo)
- [ ] Acceptance criterion 2: Enviar XP suficiente sobe nível e atualiza campos level e xp
- [ ] Acceptance criterion 3: Não permite XP negativo

