# 09: Implementar criação de personagem (nome, aparência básica)

**What to build:** Endpoint POST /characters recebe name e opcionalmente dados de aparência (ex: cor de cabelo). Retorna ID do personagem. Cliente tem tela de criação que chama o endpoint e mostra a lista.

**Blocked by:** 08

**Status:** ready-for-agent

- [ ] Acceptance criterion 1: Personagem criado com nome não vazio
- [ ] Acceptance criterion 2: Retorna 400 se nome vazio ou já existente para aquela conta (se desejar unicidade)
- [ ] Acceptance criterion 3: Personagem aparece na lista após criação

