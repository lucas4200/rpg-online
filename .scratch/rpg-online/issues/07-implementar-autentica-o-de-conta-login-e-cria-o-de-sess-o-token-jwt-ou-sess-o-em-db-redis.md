# 07: Implementar autenticação de conta: login e criação de sessão (token JWT ou sessão em DB/Redis)

**What to build:** Endpoint /login que valida credenciais, retorna token de sessão (JWT assinado ou ID de sessão). Cliente armazena token e o envia em requisições subsequentes.

**Blocked by:** 06

**Status:** ready-for-agent

- [ ] Acceptance criterion 1: Login com credenciais corretas retorna token válido
- [ ] Acceptance criterion 2: Login com senha incorreta retorna 401
- [ ] Acceptance criterion 3: Token expira após tempo configurado (ex: 1h)
- [ ] Acceptance criterion 4: Endpoint protegido (/me) requer token e devolve dados do usuário

