#!/usr/bin/env bash
# Sets @rg-tmux-toggle-scratch-indicator on each window that has a corresponding scratch session.
# Triggered via tmux hooks on session creation/destruction and window rename.

declare -A scratch_sessions

# Build a lookup set of all scratch sessions for O(1) membership checks.
while IFS= read -r session; do
    scratch_sessions["$session"]=1
done < <(tmux list-sessions -F '#S' 2>/dev/null | grep '@scratch$')

# Iterate all windows across all sessions.
# Fields are tab-separated to safely handle window names with spaces.
# We also fetch the current @rg-tmux-toggle-scratch-indicator value to avoid redundant set-option calls.
while IFS=$'\t' read -r session_name window_index window_name current_indicator; do
    # Skip scratch sessions themselves and tmux popup sessions
    case "$session_name" in *@scratch | pop-* | popup*) continue ;; esac

    # Construct the expected scratch session name for this window
    expected_scratch="${session_name}-${window_name}@scratch"

    if [[ -n "${scratch_sessions["$expected_scratch"]}" ]]; then
        # Scratch session exists — set indicator if not already set
        if [[ "$current_indicator" != "##" ]]; then
            tmux set-option -wqt "${session_name}:${window_index}" @rg-tmux-toggle-scratch-indicator "##"
        fi
    else
        # No scratch session — unset indicator if currently set
        if [[ -n "$current_indicator" ]]; then
            tmux set-option -wqut "${session_name}:${window_index}" @rg-tmux-toggle-scratch-indicator
        fi
    fi
done < <(tmux list-windows -a -F "#{session_name}	#{window_index}	#{window_name}	#{@rg-tmux-toggle-scratch-indicator}" 2>/dev/null)
