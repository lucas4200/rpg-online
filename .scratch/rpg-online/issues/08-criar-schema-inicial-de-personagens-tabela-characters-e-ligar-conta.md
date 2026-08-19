# 08: Criar schema inicial de personagens (tabela characters) e ligar à conta

**What to build:** Tabela characters com colunas: id, account_id (FK), name, level, xp, hp_max, mana_max, speed_base, strength, dexterity, intelligence, vitality, created_at. Relacionamento 1-contanta-muitos com accounts.

**Blocked by:** 07

**Status:** ready-for-agent

- [ ] Acceptance criterion 1: Tabela criada com chaves estrangeiras corretas
- [ ] Acceptance criterion 2: Quando um novo personagem é criado via endpoint /characters, linha é inserida com account_id do usuário logado
- [ ] Acceptance criterion 3: Listagem /characters?account_id=X retorna apenas personagens daquele account

