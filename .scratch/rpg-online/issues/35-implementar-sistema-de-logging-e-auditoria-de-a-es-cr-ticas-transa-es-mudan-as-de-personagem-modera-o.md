# 35: Implementar sistema de logging e auditoria de ações críticas (transações, mudanças de personagem, moderação)

**What to build:** Tabela game_logs com id, timestamp, actor_type, actor_id, action, details, ip_address. Log de login, logout, trade, criação de personagem, mudança de guild, punições, etc. Exportável para análise externa.

**Blocked by:** 34

**Status:** ready-for-agent

- [ ] Acceptance criterion 1: Toda ação crítica gera linha de log
- [ ] Acceptance criterion 2: Log pode ser consultado por tempo, tipo de ação, actor
- [ ] Acceptance criterion 3: Não contém dados pessoais além do necessário (email não logado)

