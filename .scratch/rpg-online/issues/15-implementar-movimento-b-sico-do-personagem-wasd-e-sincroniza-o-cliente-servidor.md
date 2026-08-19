# 15: Implementar movimento básico do personagem (WASD) e sincronização cliente-servidor

**What to build:** Cliente envia intenção de movimento (vetor direção) a cada input; servidor aplica velocidade base + modificadores (speed, buffs) e atualiza posição. Cliente corrige posição se receber correção do servidor.

**Blocked by:** 14

**Status:** ready-for-agent

- [ ] Acceptance criterion 1: Personagem se move no mundo com tecla WASD
- [ ] Acceptance criterion 2: Posição no cliente e servidor divergem < 0.1 unidade após correção
- [ ] Acceptance criterion 3: Velocidade aumenta conforme atributo speed ou buffs

