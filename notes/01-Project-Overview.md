---
tags: [overview]
---

# Orizon — Visão geral

Cliente mobile Flutter para image boards estilo booru (Danbooru / Gelbooru 0.2 /
Moebooru). Safe-by-default: filtra conteúdo safe a menos que o usuário mude
isso em Settings. Bloqueio permanente (não desativável pela UI) contra
conteúdo que sexualiza menores.

Sem contas, sem analytics, sem servidor próprio — tudo local no device.

## Stack

- Flutter + Riverpod (state management)
- Drift (SQLite) — persistência local
- Dio — HTTP client
- go_router — navegação
- flutter_secure_storage — dados sensíveis

Ver [pubspec.yaml](../pubspec.yaml) pra lista completa de deps.

## Features principais

Ver [README.md](../README.md) — não duplicar aqui, a lista já está lá e
tende a mudar com frequência.

## Onde mexer

- `lib/` — código Dart do app
- `test/` — testes
- `assets/` — fontes, ícones
