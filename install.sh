#!/bin/sh

UTILSH_URL="${UTILSH_URL:-https://github.com/ttych/utilsh.git}"
UTILSH_INSTALL_DIR="${UTILSH_INSTALL_DIR:-$HOME/.utilsh}"
UTILSH_INSTALL_MODE="${UTILSH_INSTALL_MODE:-$1}"

install_utilsh()
{
    printf "Cloning the utilsh's GitHub repository...\n"
    git clone "$UTILSH_URL" "$UTILSH_INSTALL_DIR" &&
        cd "$UTILSH_INSTALL_DIR" &&
        git submodule update --init &&
        "$UTILSH_INSTALL_DIR"/bin/utilsh update
}

install_utilsh

install_full()
{
    UTILSH_DIR="$UTILSH_INSTALL_DIR"

    "$UTILSH_DIR"/bin/utilsh source add https://github.com/ttych/goto.git
    "$UTILSH_DIR"/bin/utilsh source add https://github.com/ttych/pyv.git
    "$UTILSH_DIR"/bin/utilsh source add https://github.com/ttych/wtmux.git
    "$UTILSH_DIR"/bin/utilsh source add https://github.com/ttych/wwine.git

    "$UTILSH_DIR"/bin/utilsh autoload std.shl
    "$UTILSH_DIR"/bin/utilsh autoload local.shl
    "$UTILSH_DIR"/bin/utilsh autoload git_scm.shl
    "$UTILSH_DIR"/bin/utilsh autoload goto.shl
    "$UTILSH_DIR"/bin/utilsh autoload ruby_base.shl
    "$UTILSH_DIR"/bin/utilsh autoload pyv.sh
}

case "$UTILSH_INSTALL_MODE" in
    full)
        install_full
        ;;
esac
