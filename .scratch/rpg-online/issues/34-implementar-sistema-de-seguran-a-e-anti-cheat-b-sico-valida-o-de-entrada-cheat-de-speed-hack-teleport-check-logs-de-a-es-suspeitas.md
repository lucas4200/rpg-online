# 34: Implementar sistema de segurança e anti-cheat básico: validação de entrada, cheat de speed-hack, teleport check, logs de ações suspeitas

**What to build:** Servidor valida que posição recebida do cliente está dentro de limites plausíveis (baseado em velocidade máxima + lag). Detecta mudanças súbitas de posição (teleport) e velocidade anormal. Aplica punição (aviso, kick, ban temporário). Log de eventos de segurança.

**Blocked by:** 14,15,21,32

**Status:** ready-for-agent

- [ ] Acceptance criterion 1: Movimento dentro de velocidade máxima + tolerância não gera alerta
- [ ] Acceptance criterion 2: Movimento que excede velocidade máxima em X% gera aviso e possível kick
- [ ] Acceptance criterion 3: Teleport (mudança de posição > Y unidade em um tick) gera alerta imediato
- [ ] Acceptance criterion 4: Log de segurança contém timestamp, jogador ID, tipo de suspeita, ação tomada

