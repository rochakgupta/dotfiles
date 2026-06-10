#!/usr/bin/env bash

current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
scripts_dir="$current_dir/scripts"

set-hook() {
    tmux set-hook -g "$1" "run-shell -b \"$scripts_dir/update-indicators.bash\""
}

set-hook session-created
set-hook session-closed
set-hook session-renamed
set-hook window-renamed
