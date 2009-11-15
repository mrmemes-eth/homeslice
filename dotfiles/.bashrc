export PS1="[\T][\u@\h][\W]$ "
# path
export PATH="/opt/local/bin:/opt/local/sbin:~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/pgsql/bin:/usr/local/ec2/bin:$PATH"

# color term
export CLICOLOR=1
#export LSCOLORS=BxFxCxDxBxegedabagacad
export LSCOLORS=Dxfxcxdxbxegedabadacad
export TERM=xterm-color
export LC_CTYPE=en_US.UTF-8

# editor
export EDITOR='mate -w'

# x11
export DISPLAY=:0.0

# EC2
export JAVA_HOME="/usr/"
export EC2_HOME="/usr/local/ec2/"
export EC2_PRIVATE_KEY="~/.aws/pk-BK6LLZZBIUBRGQZC6C2LWKBN3U56IBX3.pem"
export EC2_CERT="~/.aws/cert-BK6LLZZBIUBRGQZC6C2LWKBN3U56IBX3.pem"

alias l='ls -hola'
alias ls='ls -G'
alias ll='ls -hl'
