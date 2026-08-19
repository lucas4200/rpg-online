# 36: Implementar sistema de denúncia dentro do jogo (botão de report, fila de revisão)

**What to build:** Interface no cliente para reportar outro jogador por comportamento (spam, abuso, cheating). Report entra em fila para revisão por moderador. Moderador pode aplicar pena (mute, jail, ban) com motivo.

**Blocked by:** 35

**Status:** ready-for-agent

- [ ] Acceptance criterion 1: Botão de report aparece no perfil do jogador
- [ ] Acceptance criterion 2: Report armazenado com timestamp, reporter ID, reported ID, motivo, evidência opcional (screenshot opcional)
- [ ] Acceptance criterion 3: Moderador pode visualizar lista pendente e agir
- [ ] Acceptance criterion 4: Aplicar pena atualiza status do jogador (ex: mutado por 1h)

