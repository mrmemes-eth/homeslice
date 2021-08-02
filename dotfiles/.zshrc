# useful for debugging load time
# typeset -F SECONDS=0

fpath=(
  $fpath
  ~/.rvm/scripts/zsh/Completion
  ~/.zsh/functions
  /usr/local/share/zsh/site-functions
)

source "$HOME/.sharedrc"

# color term
export CLICOLOR=1
export LSCOLORS=Dxfxcxdxbxegedabadacad
export ZLS_COLORS=$LSCOLORS
export LC_CTYPE=en_US.UTF-8
export LESS=FRX
# make with the full color spectrum
export TERM=xterm-256color


# make with the nice completion
autoload -U compinit; compinit

# Completion for kill-like commands
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"
zstyle ':completion:*:ssh:*' tag-order hosts users
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zshcache

# make with the pretty colors
autoload colors; colors

# just say no to zle vim mode:
bindkey -e

# options
setopt appendhistory autocd extendedglob histignoredups nonomatch prompt_subst interactivecomments

# Bindings
# external editor support
autoload edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Partial word history completion
bindkey '\ep' up-line-or-search
bindkey '\en' down-line-or-search
bindkey '\ew' kill-region

if [ -z "$TMUX" ]; then
  fg-widget() {
    stty icanon echo pendin -inlcr < /dev/tty
    stty discard '^O' dsusp '^Y' lnext '^V' quit '^\' susp '^Z' < /dev/tty
    zle reset-prompt
    if jobs %- >/dev/null 2>&1; then
      fg %-
    else
      fg
    fi
  }

  zle -N fg-widget
  bindkey -M emacs "^Z" fg-widget
  bindkey -M vicmd "^Z" fg-widget
  bindkey -M viins "^Z" fg-widget
fi

# prompt
PROMPT='%{[38;5;145m%}%2c %{$reset_color%}%{[01;38;5;147m%}λ %{$reset_color%}'

# if on a remote host, show host name
[[ -n "$SSH_CLIENT" ]] && PROMPT="$HOST:$PROMPT"

# show non-success exit code in right prompt
RPROMPT="%(?..{%{$fg[red]%}%?%{$reset_color%}})"

# history
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# default apps
export ALTERNATE_EDITOR=''
export VISUAL='vim'
export PAGER='less'
export EDITOR="$VISUAL"

# aliases
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias rspec='nocorrect rspec'
alias ll="ls -l"
alias la="ls -a"
alias l.='ls -ld .[^.]*'
alias lsd='ls -ld *(-/DN)'
alias md='mkdir -p'
alias rd='rmdir'
alias rsync='rsync --partial --progress'
alias pullall='find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;'


# git aliases

alias gco='git checkout'

# set cd autocompletion to commonly visited directories
cdpath=(~ ~/src "$HOME/dev")

# rvm-install added line:
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi

# make with the colorful grepping
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='00;38;5;226'

export GOBIN='/usr/local/go/bin'

export PATH="$PATH:$HOME/.rvm/bin:/usr/local/go/bin" # Add RVM and Go bin PATHs for scripting

# Source local overrides if present:
if [[ -f "$HOME/.zshrc.local" ]] ; then source "$HOME/.zshrc.local" ; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/stephen/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/stephen/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/stephen/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/stephen/google-cloud-sdk/completion.zsh.inc'; fi

# aaaand NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# useful for debugging load time
# echo "$SECONDS seconds to load"
