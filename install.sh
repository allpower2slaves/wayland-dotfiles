#!/bin/sh
__target=""$HOME"/"$(printf "$PATH" | grep -q '\.local/bin' && printf ".local/bin" || printf 'bin')""
__repo="$(realpath "$(dirname "$0")")"

printf "$__target\n" 1>&2 # debug

printf "wl-lock wl-screenshot dwlrc startwl\n" | tr ' ' '\n' | while read __file; do
	ln -svif ""$__repo"/"$__file"" ""$__target"/"$__file""
done
