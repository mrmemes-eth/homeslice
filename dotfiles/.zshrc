path=(
  "$HOME/bin"
  /usr/local/bin
  /usr/local/sbin
  /opt/local/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  /usr/X11/bin
)

# color term
export CLICOLOR=1
export LSCOLORS=Dxfxcxdxbxegedabadacad
export ZLS_COLORS=$LSCOLORS
export TERM=xterm
export LC_CTYPE=en_US.UTF-8
export LESS=FRX

# make with the nice completion
autoload -U compinit; compinit

# make with the pretty colors
autoload colors; colors

# options
setopt appendhistory autocd extendedglob histignoredups correctall nonomatch prompt_subst

git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "(${ref#refs/heads/})"
}

# prompt
PROMPT='%{$fg[yellow]%}%2c%{$reset_color%}$(git_prompt_info)%# '
# if on a remote host, show host name
[[ -n "$SSH_CLIENT" ]] && PROMPT="$HOST:$PROMPT"
# if running screen, show window #
[[ x$WINDOW != x ]] && PROMPT="$WINDOW:$PROMPT"
# show non success exit codes in right prompt
RPROMPT="%(?..{%{$fg[red]%}%?%{$reset_color%}})"

# history
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=10000

# default apps
(( ${+BROWSER} )) || export BROWSER='lynx'
(( ${+PAGER}   )) || export PAGER='less'
(( ${+EDITOR}  )) || export EDITOR='vim'

# just say no to zle vim mode:
bindkey -e

# aliases
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias ll="ls -l"
alias l.='ls -ld .[^.]*'
alias lsd='ls -ld *(-/DN)'
alias md='mkdir -p'
alias rd='rmdir'
alias cd..='cd ..'
alias ..='cd ..'
alias spec='spec -c'
alias rsync='rsync --partial --progress'
alias rake='time rake'

# personal dev env
export DEV_DIR="$HOME/dev"

# hashrocket dev env
export HASHROCKET_DIR="$DEV_DIR/hashrock"
hrc="$HASHROCKET_DIR/dotmatrix/.hashrc"
[[ -a $hrc ]] && source $hrc

# set cd autocompletion to commonly visited directories
cdpath=(~ ~/src $DEV_DIR $HASHROCKET_DIR ..)

preview(){
  md_file="$1"
  file_array=(${(s:.:)md_file})
  file_array=($file_array[0,-2] 'html')
  maruku $md_file
  open ${(j:.:)file_array}
}

export RUBYOPT='rubygems'

# rvm-install added line:
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi
