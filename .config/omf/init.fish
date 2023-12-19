set -U fish_greeting
set -gx GPG_TTY (tty)
set -U EDITOR nvim

set IS_WSL grep -i Microsoft /proc/version

# Aliases
if type -q bat; alias cat="bat"; end;
if $IS_WSL > /dev/null; alias adb="adb.exe"; end;

