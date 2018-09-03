#!/bin/sh
set -o nounset
set -o pipefail
set -o errexit

rm --recursive build 2>/dev/null && :
echo 'beginning build'

builder () {
    local -
    set -o nounset
    set -o errexit
    local source_dir="${1%/}" ; shift
    local destination_dir="${1%/}" ; shift
    for source in "$@"; do
        [ ! -e "$source" ] && continue
        destination="$destination_dir${source#$source_dir}"

        if [ -d "$source" ]; then
            mkdir "$destination"
            builder "$source_dir" "$destination_dir" "$source"/*

        elif [ -x "$source" ]; then
            "$source" > "$destination"

        elif [ -f "$source" ]; then
            cat "$source" > "$destination"

        else ERROR; fi
    done
}

builder src/ build/ src/
