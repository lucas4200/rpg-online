# 14: Implementar tick loop do servidor (ex: 20 Hz) e atualização de estado básico (posição, recursos)

**What to build:** Loop principal do servidor que a cada tick: processa entrada dos clientes, aplica movimento, regenera recursos, envia estado atualizado aos clientes. Cliente interpola suavemente.

**Blocked by:** 13,04

**Status:** ready-for-agent

- [ ] Acceptance criterion 1: Servidor roda a 20 ticks/s sem travar
- [ ] Acceptance criterion 2: Cliente recebe atualizações de posição e recursos a cada ~50ms
- [ ] Acceptance criterion 3: Movimento é suave e autoritário (servidor corrige se houver discrepância)

