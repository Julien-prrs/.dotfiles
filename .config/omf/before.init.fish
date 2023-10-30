if not set -q ZEN_SESSION_INITIALIZED
   set -l GREP_MATCH (grep '^NAME=' /etc/os-release)
   set ZEN_SESSION_NAME (string match '^NAME="(\S+).*"$' -r -g $GREP_MATCH)

   switch $ZEN_SESSION_NAME
      case Ubuntu
         set -x ZEN_SESSION_COLOR "#ff5722"
      case Arch
         set -x ZEN_SESSION_COLOR "#1793d1"
   end
end
