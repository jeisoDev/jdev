# Changelog

Todas as mudanças relevantes deste projeto são documentadas aqui.

O formato segue o [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e o projeto adota o [Versionamento Semântico](https://semver.org/lang/pt-BR/).

## [1.1.0]

### Adicionado
- Campo `FLUXO` nas fichas: passo a passo de ponta a ponta, com comandos destacados.
- Campo `VER_TAMBEM` nas fichas: ferramentas relacionadas, incentivando o encadeamento.
- Banner ASCII na listagem e na ajuda.
- Instalador `install.sh` (com opção `--uninstall`).
- `LICENSE` (MIT), `CONTRIBUTING.md`, `CHANGELOG.md` e integração contínua (CI).

### Alterado
- Todas as 32 fichas revisadas e enriquecidas com fluxo completo.
- Código reorganizado, com indentação consistente e visual mais limpo.

## [1.0.0]

### Adicionado
- Primeira versão do `jsec`.
- Comandos: ficha por ferramenta, listagem por categoria, busca (`-s`),
  filtro por categoria (`-c`), ajuda (`-h`) e versão (`--version`).
- 32 fichas de ferramentas populares do Kali Linux.
- Arquitetura com base de conhecimento (fichas) separada da lógica.
