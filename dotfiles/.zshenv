# Paths for prepending
for dir in /usr/local/bin \
  "$HOME/.local/bin" \
  "$HOME/bin" \
  "$HOME/.ebcli-virtual-env/executables" \
  /usr/local/go/bin \
  "$HOME/.foundry/bin" \
  "$HOME/.yarn/bin" \
  "$HOME/.config/yarn/global/node_modules/.bin"; do
  case "$PATH:" in
    *:"$dir":*) PATH="`echo "$PATH"|sed -e "s#:$dir##"`" ;;
  esac
  case "$dir" in
    /*) [ ! -d "$dir" ] || PATH="$dir:$PATH" ;;
    *) PATH="$dir:$PATH" ;;
  esac
done

# Paths for appending
for dir in /usr/local/sbin /opt/local/sbin /usr/X11/bin; do
  case ":$PATH:" in
    *:"$dir":*) ;;
    *) [ ! -d "$dir" ] || PATH="$PATH:$dir" ;;
  esac
done

# remove duplicates in $PATH
typeset -aU path

. "$HOME/.cargo/env"
