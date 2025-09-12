#!/bin/sh
__target=""$HOME"/"$(printf "$PATH" | grep -q '\.local/bin' && printf ".local/bin" || printf 'bin')""
__repo="$(realpath "$(dirname "$0")")"

__configdir="$HOME/.config" 

mkdir -p "$__configdir"
printf "DEBUG $__target\n" 1>&2 # debug

printf "wl-lock wl-screenshot dwlrc startwl\n" | tr ' ' '\n' | while read __file; do
	ln -svif ""$__repo"/"$__file"" ""$__target"/"$__file""
done

printf "foot fuzzel xdg-desktop-portal\n" | tr ' ' '\n' | while read __dir; do
	ln -svif ""$__repo"/"$__dir"" ""$__configdir"/"$__dir""
done
