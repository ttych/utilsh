#!/bin/sh

xkeymap_auto()
{
    if xmodmap -pke 2>/dev/null | grep -q ' 24 = q'; then
        setxkbmap -option "compose:ralt"
    fi
}

xkeymap_auto "$@"
