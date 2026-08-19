# 06: Implementar autenticação de conta: registro de usuário (email/senha hash)

**What to build:** Endpoint no servidor /register que recebe email, senha, cria hash (bcrypt), grava na tabela accounts do PostgreSQL. Cliente Godot tem tela de registro que chama o endpoint.

**Blocked by:** 04,05,02

**Status:** done

- [x] Acceptance criterion 1: Tabela accounts criada com colunas id, email (única), password_hash, created_at
- [x] Acceptance criterion 2: Registro com email válido e senha forte gera hash e grava linha
- [x] Acceptance criterion 3: Registro com email duplicado retorna erro 409
- [x] Acceptance criterion 4: Senha armazenada apenas como hash
