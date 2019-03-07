#!/bin/sh

UTILSH_URL="${UTILSH_URL:-https://github.com/ttych/utilsh.git}"
UTILSH_INSTALL_DIR="${UTILSH_INSTALL_DIR:-$HOME/.utilsh}"

install_utilsh()
{
    printf "Cloning the utilsh's GitHub repository...\n"
    git clone "$UTILSH_URL" "$UTILSH_INSTALL_DIR"
}


install_utilsh