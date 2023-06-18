#/bin/sh

#updatedb -l 0 -o $HOME/files.index -U $HOME
fd --hidden -e code-workspace . $HOME | \
	grep -Ev '\.cache|\.local|node_module|History|Template' | \
	sed "s|$HOME/||g" | \
	sort \
	> $XDG_CACHE_HOME/vscode-project-list
