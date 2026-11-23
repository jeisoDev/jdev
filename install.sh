#!/usr/bin/env bash
#
# install.sh - instalador do jsec
# Autor  : json-dev
# Licença: MIT
#
# Uso:
#   ./install.sh              instala (tenta /usr/local/bin, senão ~/.local/bin)
#   ./install.sh --uninstall  remove o link criado
#

set -euo pipefail

readonly DIR_SCRIPT="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
readonly JSEC="$DIR_SCRIPT/jsec"
readonly NOME="jsec"

if [ -t 1 ]; then
    V=$'\033[1;32m'; A=$'\033[1;33m'; R=$'\033[1;31m'; Z=$'\033[0m'
else
    V="" A="" R="" Z=""
fi

info()  { printf "%s==>%s %s\n" "$V" "$Z" "$*"; }
aviso() { printf "%s[!]%s %s\n" "$A" "$Z" "$*"; }
erro()  { printf "%s[erro]%s %s\n" "$R" "$Z" "$*" >&2; }

if [ ! -f "$JSEC" ]; then
    erro "não encontrei o script 'jsec' em $DIR_SCRIPT"
    erro "rode o install.sh de dentro da pasta do projeto."
    exit 1
fi

escolher_destino() {
    if [ -w /usr/local/bin ]; then
        printf "/usr/local/bin\n"
        return 0
    fi
    if command -v sudo >/dev/null 2>&1 && [ -d /usr/local/bin ]; then
        printf "/usr/local/bin\n"
        return 0
    fi
    printf "%s/.local/bin\n" "$HOME"
}

readonly DESTINO="$(escolher_destino)"
readonly LINK="$DESTINO/$NOME"

usa_sudo() {
    [ ! -w "$DESTINO" ] && command -v sudo >/dev/null 2>&1
}

if [ "${1:-}" = "--uninstall" ] || [ "${1:-}" = "-u" ]; then
    if [ -L "$LINK" ] || [ -e "$LINK" ]; then
        info "removendo $LINK"
        if usa_sudo; then sudo rm -f "$LINK"; else rm -f "$LINK"; fi
        info "jsec removido."
    else
        aviso "nada para remover em $LINK"
    fi
    exit 0
fi

info "Instalando jsec a partir de: $DIR_SCRIPT"

chmod +x "$JSEC"
info "permissão de execução aplicada ao script jsec"

if [ ! -d "$DESTINO" ]; then
    info "criando diretório $DESTINO"
    mkdir -p "$DESTINO"
fi

info "criando link: $LINK -> $JSEC"
if usa_sudo; then
    sudo ln -sf "$JSEC" "$LINK"
else
    ln -sf "$JSEC" "$LINK"
fi

case ":$PATH:" in
    *":$DESTINO:"*)
        ;;
    *)
        aviso "$DESTINO não está no seu PATH."
        aviso "Adicione esta linha ao seu ~/.bashrc ou ~/.zshrc:"
        printf "    export PATH=\"%s:\$PATH\"\n" "$DESTINO"
        aviso "Depois rode: source ~/.bashrc (ou abra um novo terminal)."
        ;;
esac

info "Pronto! Teste com:"
printf "    %sjsec --version%s\n" "$V" "$Z"
printf "    %sjsec nmap%s\n" "$V" "$Z"
