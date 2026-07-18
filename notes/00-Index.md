---
tags: [index]
---

# Orizon — Vault de contexto

Este vault existe pra guardar contexto do projeto em markdown puro, lido tanto
por mim (Claude Code) quanto por outros agentes (Gemini via Obsidian, Gemini CLI,
Antigravity). A ideia é registrar aqui o que não dá pra derivar só lendo o
código — decisões, motivações, convenções — pra não precisar reexplicar do
zero em cada sessão/ferramenta.

## Notas

- [[01-Project-Overview]] — o que é o Orizon, stack, features
- [[02-Architecture]] — como o código está organizado
- [[03-Decisions-Log]] — decisões técnicas e o porquê
- [[04-Glossary]] — termos/abreviações específicas do projeto
- [[05-Roadmap]] — status atual e próximos passos

## Convenção de uso

- Atualize `03-Decisions-Log.md` sempre que uma decisão não óbvia for tomada
  (troca de lib, escolha de arquitetura, trade-off aceito).
- Não duplique informação que já está no código ou no `README.md` — linke pra
  lá em vez de copiar.
- Qualquer agente (humano ou IA) pode editar essas notas; são texto simples.
