export ZSH="${HOME}/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking

# Process the dircolors from the home dir to make folders look less terrbible
if [[ ! -z "${HOME}/.dircolors" ]]; then
  eval `dircolors ${HOME}/.dircolors`
else
	echo "dircolors not set"
fi

# fzf-tab settings. I don't actually like fzf-tab all that much.
# don't sort git branches
# zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
# zstyle ':completion:*:descriptions' format '[%d]'
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
# style ':completion:*' menu no
# preview directory's content with eza when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa --icons --sort name -1a --color=always $realpath'
# switch group using `<` and `>`
# zstyle ':fzf-tab:*' switch-group '<' '>'
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
# ENABLE_CORRECTION="true"

# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
    extract
	history-substring-search
    sudo
	cp # cpv command (uses rsync)
	dirhistory # alt-left to go back
	gh
	git
	golang
	helm
	kubectl
	ssh

    # installed separately
#	fzf-tab
    zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# source ~/dev/hpe-cds/pc-compute/.env
eval "$(atuin init zsh)"
eval "$(zoxide init zsh --cmd cd)"
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

PROMPT="%(?:%{$fg_bold[magenta]%}%n:%{$fg_bold[red]%}%n)"
PROMPT+='%{$reset_color%}:%{$fg_bold[blue]%}${$(git_prompt_info):-%~%f}%{$reset_color%}$ '
ZSH_THEME_GIT_PROMPT_PREFIX="%c %{$fg_bold[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
