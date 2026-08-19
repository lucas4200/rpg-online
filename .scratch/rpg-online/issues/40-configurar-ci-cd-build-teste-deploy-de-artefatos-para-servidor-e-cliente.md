# 40: Configurar CI/CD (build, teste, deploy de artefatos) para servidor e cliente

**What to build:** Pipeline (ex: GitHub Actions) que: compila servidor C++, roda testes unitários e de integração, compila cliente Godot, roda testes de cena, gera artefatos (binários, exportações).

**Blocked by:** 31,39

**Status:** ready-for-agent

- [ ] Acceptance criterion 1: Novo commit dispara pipeline
- [ ] Acceptance criterion 2: Pipeline falha se qualquer teste falhar
- [ ] Acceptance criterion 3: Artefatos são disponibilizados para download (ou deploy em ambiente de teste)

