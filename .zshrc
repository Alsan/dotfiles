# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source "$HOME/.config/env.d/01.env.zsh"
source "$HOME/.config/env.d/02.plugins.zsh"
source "$HOME/.config/env.d/03.options.zsh"
source "$HOME/.config/env.d/04.completions.zsh"
source "$HOME/.config/env.d/05.alias.zsh"
source "$HOME/.config/env.d/06.bindkeys.zsh"
source "$HOME/.config/env.d/99.finialize.zsh"
