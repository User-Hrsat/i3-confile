# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890

# export PAGER="most"
# export HISTFILE=~/.zsh_history


# 启动时设置光标样式 -> VIM
# echo -ne '\e[3 q' # Use underline shape cursor on startup.

# Ps = 0  -> blinking block.
# Ps = 1  -> blinking block (default).
# Ps = 2  -> steady block.
# Ps = 3  -> blinking underline.
# Ps = 4  -> steady underline.
# Ps = 5  -> blinking bar (xterm).
# Ps = 6  -> steady bar (xterm).

# alias ls='ls --color=auto'
