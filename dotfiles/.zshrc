# path (for some reason, I can't use $PATH in the path array declaration, so 
# I'm setting it to it's literal value of: /opt/local/bin /opt/local/sbin 
# /usr/bin /bin /usr/sbin /sbin /usr/X11/bin)
path=(
  "$HOME/bin"
  /usr/local/bin
  /usr/local/sbin
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
setopt appendhistory autocd extendedglob histignoredups correctall nonomatch

# places I lurk
cdpath=(~ ~/development ~/development/hashrock ..)

# prompt
PROMPT="%{$fg[yellow]%}%2c %{$reset_color%}%# "
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
(( ${+PAGER} ))   || export PAGER='less'
(( ${+EDITOR}))   || export EDITOR='vim'

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

# hashrocket stuffs
export HASHROCKET_DIR="$HOME/development/hashrock"
hpd="$HASHROCKET_DIR/dotmatrix/.hashrc"
[[ -a $hpd ]] && source $hpd

twiki(){
  [[ -x `which say` ]] && say -v Zarvox 'beedee-beedee-beedee'
  rake db:migrate \
  && rake db:migrate:redo \
  && rake db:test:prepare
}

preview(){
  md_file="$1"
  file_array=(${(s:.:)md_file})
  file_array=($file_array[0,-2] 'html')
  maruku $md_file
  open ${(j:.:)file_array}
}

# -- start rip config -- #
RIPDIR=/Users/voxdolo/.rip
RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="$PATH:$RIPDIR/active/bin"
export RIPDIR RUBYLIB PATH
# -- end rip config -- #
