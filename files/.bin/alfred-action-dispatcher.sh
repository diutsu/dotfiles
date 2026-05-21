#!/bin/zsh

ARG="$1"
UID="$2"

if [[ "$UID" == "open_url" ]]; then
    open "$ARG"
else
    echo -n "$ARG" | pbcopy
fi

