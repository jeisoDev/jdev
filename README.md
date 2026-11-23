<div align="center">

```
    _
   (_)___  ___  ___
   | / __|/ _ \/ __|
   | \__ \  __/ (__
  _/ |___/\___|\___|
 |__/
```

# jsec

**Seu cheat sheet didático das ferramentas de pentest do Kali Linux — em português, direto no terminal.**

[![Licença: MIT](https://img.shields.io/badge/Licen%C3%A7a-MIT-green.svg)](LICENSE)
[![Shell: Bash](https://img.shields.io/badge/Shell-Bash-121011?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![PRs Welcome](https://img.shields.io/badge/PRs-bem--vindos-brightgreen.svg)](CONTRIBUTING.md)
[![Feito no Brasil](https://img.shields.io/badge/feito%20no-Brasil-009c3b.svg)](#-sobre-o-projeto)
[![Ferramentas](https://img.shields.io/badge/ferramentas-32-blue.svg)](#-ferramentas-cobertas)

</div>

---

## 💡 Sobre o projeto

Entrar na área de segurança da informação é empolgante — e intimidador. São
**dezenas de ferramentas**, cada uma com flags próprias, e boa parte do material
está em inglês ou pressupõe que você já sabe o básico.

O **`jsec`** nasceu para mudar isso. É uma ferramenta de linha de comando que
funciona como um **tutor de bolso**: você digita `jsec` seguido do nome de outra
ferramenta e recebe, em **português claro**, o que ela faz, um **exemplo prático**,
a **explicação de cada flag**, um **fluxo de uso completo** e uma **dica** para não
cair nos erros clássicos de iniciante.

> 🇧🇷 **A missão:** ajudar a comunidade brasileira de segurança. Uma didática
> acessível para quem está **começando na área** ou só quer **entender melhor as
> ferramentas** — sem precisar decorar `man page` ou garimpar tutorial espalhado.

É **100% offline**, roda em qualquer máquina com bash e foi pensado para **crescer
com a comunidade**: adicionar uma ferramenta é preencher um arquivo de texto.

---

## ✨ Funcionalidades

- 📚 **Fichas didáticas** para 32 ferramentas populares do Kali.
- 🔎 **Busca** por nome, descrição ou apelido (`jsec -s senha`).
- 🗂️ **Listagem por categoria** (`jsec -c "brute force"`).
- 🧭 **Fluxo de uso ponta a ponta** em cada ficha (do recon ao resultado).
- 🔗 **"Veja também"** — mostra como uma ferramenta se conecta às outras.
- 🎨 **Saída colorida** (e que se desativa sozinha ao redirecionar para arquivo).
- ⚡ **Sem dependências** além do coreutils — funciona offline.
- 🧩 **Fácil de expandir** — a base de conhecimento é separada da lógica.

---

## 📑 Índice

- [Demonstração](#-demonstração)
- [Instalação](#-instalação)
- [Como usar](#-como-usar)
- [Ferramentas cobertas](#-ferramentas-cobertas)
- [Arquitetura e como expandir](#-arquitetura-e-como-expandir)
- [Contribuindo](#-contribuindo)
- [Aviso legal](#-aviso-legal)
- [Licença](#-licença)

---

## 🎬 Demonstração

```console
$ jsec nmap

> nmap   [Scanner de rede / portas]
--------------------------------------------------

O que é / para que serve
  Mapeia hosts e portas numa rede, descobre serviços, versões e sistema
  operacional. É quase sempre o PRIMEIRO passo de um pentest.

Exemplo prático
  nmap -sV -sC -p- <alvo>

Passo a passo (o que cada parte faz)
  - -sV: detecta a versão do serviço rodando em cada porta aberta
  - -sC: roda os scripts padrão do NSE (checagens seguras e úteis)
  - -p-: varre TODAS as 65535 portas
  ...

Fluxo completo (do começo ao fim)
  1) Varredura rápida só para achar quais portas estão abertas:
  nmap -F <alvo>
  ...

Veja também
  masscan, whatweb/nikto (web), searchsploit (exploits), enum4linux (SMB)
```

---

## 🚀 Instalação

O `jsec` é 100% bash e usa apenas o coreutils — roda **offline**, sem dependências.

### Opção 1 — Instalador automático (recomendada)

```bash
git clone https://github.com/jeisoDev/jdev.git
cd jdev
chmod +x install.sh
./install.sh
```

O instalador dá permissão de execução e cria um link no seu `PATH`
(`/usr/local/bin` ou, se não puder, `~/.local/bin`). Para remover:

```bash
./install.sh --uninstall
```

### Opção 2 — Instalação manual

```bash
# 1. permissão de execução
chmod +x jsec

# 2. link no PATH (escolha uma)
sudo ln -s "$(pwd)/jsec" /usr/local/bin/jsec      # global
# ou, sem sudo:
mkdir -p ~/.local/bin && ln -s "$(pwd)/jsec" ~/.local/bin/jsec
```

> ℹ️ O `jsec` localiza sozinho a pasta `fichas/` que fica ao seu lado, inclusive
> via link simbólico. **Não separe** o script da pasta `fichas/`.

### Testando

```bash
jsec --version
jsec nmap
```

---

## 🧭 Como usar

| Comando                | O que faz                                            |
|------------------------|------------------------------------------------------|
| `jsec <ferramenta>`    | Mostra a ficha completa da ferramenta                |
| `jsec`                 | Lista todas as ferramentas, agrupadas por categoria  |
| `jsec -s <termo>`      | Busca por nome ou descrição                          |
| `jsec -c <categoria>`  | Lista ferramentas de uma categoria                   |
| `jsec -h`, `--help`    | Ajuda de uso                                         |
| `jsec --version`       | Versão e autor                                       |

### Exemplos

```bash
jsec hydra              # como usar o hydra, passo a passo
jsec -s senha           # tudo que fala de senha
jsec -c "brute force"   # ferramentas de brute force
jsec nc                 # funciona por apelido (nc -> netcat)
```

Se a ferramenta não existir, o `jsec` sugere nomes parecidos e lembra do comando
de busca. 😉

---

## 🧰 Ferramentas cobertas

| Categoria                    | Ferramentas |
|------------------------------|-------------|
| Scanner de rede / portas     | `nmap`, `masscan` |
| Análise de tráfego           | `tcpdump`, `wireshark`/`tshark` |
| Enumeração web               | `gobuster`, `ffuf`, `dirb`, `wfuzz` |
| Vulnerabilidades web         | `nikto`, `nuclei`, `wpscan` |
| Reconhecimento web           | `whatweb`, `httpx`, `katana`, `gau` |
| Reconhecimento (subdomínios) | `subfinder`, `amass` |
| Brute force                  | `hydra` |
| Cracking (offline)           | `john`, `hashcat`, `hashid` |
| Exploração                   | `sqlmap`, `dalfox`, `searchsploit`, `metasploit` |
| SMB / Windows                | `enum4linux`, `smbclient`, `crackmapexec`, `responder` |
| Segurança Wi-Fi              | `aircrack-ng` |
| Utilitários de rede          | `netcat`, `curl` |

Rode `jsec` sem argumentos para ver a lista sempre atualizada.

---

## 🏗️ Arquitetura e como expandir

O projeto separa **lógica** de **conteúdo**:

```
jsec                 # script principal — só a lógica de exibição/busca
install.sh           # instalador
fichas/              # base de conhecimento — uma ficha por ferramenta
├── _modelo.ficha    # modelo para copiar (arquivos iniciando com _ são ignorados)
├── nmap.ficha
├── hydra.ficha
└── ...
```

### Adicionar uma ferramenta nova

Não é preciso mexer no script:

```bash
cp fichas/_modelo.ficha fichas/minhaferramenta.ficha
# preencha os campos e pronto:
jsec minhaferramenta
```

### Formato de uma ficha

```bash
NOME="nmap"
CATEGORIA="Scanner de rede / portas"
ALIASES=""                          # apelidos (opcional)
DESC="Descrição curta do que faz."
EXEMPLO='nmap -sV -sC -p- <alvo>'   # use <placeholders> claros
PASSOS="- -sV: explica a flag
- <alvo>: explica o placeholder"    # multilinha é permitido
FLUXO="1) primeiro passo:
\$ nmap -F <alvo>
2) segundo passo..."                # OPCIONAL; linhas com '\$ ' viram comando
DICA="Uma dica ou erro comum a evitar."
VER_TAMBEM="masscan, whatweb"       # OPCIONAL
```

Campos **obrigatórios**: `NOME`, `CATEGORIA`, `DESC`, `EXEMPLO`, `PASSOS`, `DICA`.
Campos **opcionais**: `ALIASES`, `FLUXO`, `VER_TAMBEM` (deixe `""` para ocultar).

Detalhes completos em [CONTRIBUTING.md](CONTRIBUTING.md).

---

## 🤝 Contribuindo

Contribuições são muito bem-vindas — este é um projeto da comunidade! A forma mais
fácil de ajudar é **adicionar ou melhorar fichas**. Veja o guia completo em
[CONTRIBUTING.md](CONTRIBUTING.md).

Toda mudança passa por validação automática (sintaxe das fichas e dos scripts)
via GitHub Actions.

---

## ⚠️ Aviso legal

> Estas ferramentas devem ser usadas **apenas** em sistemas **seus** ou com
> **autorização explícita e por escrito**. Testar, varrer ou atacar sistemas de
> terceiros sem permissão é **crime** (no Brasil, enquadra-se na Lei 12.737/2012,
> entre outras).
>
> O `jsec` tem finalidade **estritamente educacional** e apenas **explica** os
> comandos — ele **não executa** nenhuma das ferramentas descritas. O autor e os
> contribuidores não se responsabilizam pelo uso indevido.

Pratique em ambientes feitos para isso: laboratórios locais, máquinas vulneráveis
propositais (ex.: Metasploitable, DVWA) e plataformas como Hack The Box ou
TryHackMe.

---

## 📄 Licença

Distribuído sob a licença **MIT** — veja [LICENSE](LICENSE). Livre para usar,
modificar e compartilhar.

---

<div align="center">

Feito com 💚 para a comunidade brasileira de segurança — por **json-dev**.

Se este projeto te ajudou, deixe uma ⭐ e compartilhe com quem está começando!

</div>
