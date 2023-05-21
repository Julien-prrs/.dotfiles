set -U fish_greeting
set -gx GPG_TTY (tty)
set -U EDITOR nvim

# Aliases
if type -q bat; alias cat="bat"; end;
