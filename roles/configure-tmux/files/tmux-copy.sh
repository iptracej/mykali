tmux set-option mouse on
tmux bind-key -Tcopy-mode-vi MouseDragEnd1Pane send-key -X copy-pipe "xsel -i -b"
tmux bind-key -Tcopy-mode-vi Y send -X copy-pipe "xsel -i -b"
