# 30: Implementar arquitetura de mundo expansível (chunks/zones, carregamento sob demanda)

**What to build:** Mundo dividido em zonas (ex: floresta, planície, masmorra). Cada zona tem seu próprio conjunto de dados (monsters, NPCs, quests). Servidor carrega/descarga zona com base na proximidade dos jogadores.

**Blocked by:** 03,05

**Status:** ready-for-agent

- [ ] Acceptance criterion 1: Jogador cruzando border de zona dispara evento de carregamento/descarga
- [ ] Acceptance criterion 2: Zona carregada tem seus monsters e NPCs ativos
- [ ] Acceptance criterion 3: Zona descarregada libera memória e para processamento de IA

