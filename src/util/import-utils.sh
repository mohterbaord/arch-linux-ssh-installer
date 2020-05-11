source './src/util/string-utils.sh'

function _get_module_path() {
  # Adds `./` prefix to the argument if it is not prefixed neither with `./`
  # nor `/`. 

  local module=$(trim "$1")
  if [ ! -z "$module" ] && [[ "$module" != ./* ]] && [[ "$module" != /* ]]; then
    echo "./$module"
  else
    echo "$module"
  fi
}

function get_module() {
  # Echoes a module path or default.
  #
  # Useful for dynamic module importing via `source` command.
  #
  # Exits with 22 error code if both `module` and `module_default` parameters
  # are empty after trimming at the same time.
  #
  # If a file does not exist at `module` path and the 3rd argument is `1`,
  # then the file at `module_default` path will be loaded silently instead of
  # `module` path.

  # Parameters:
  local module=$(_get_module_path "$1")
  local module_default=$(_get_module_path "$2")
  local load_default_silently=$3

  if [ -z "$module" ]; then
    if [ -z "$module_default" ]; then
      exit 22
    else
      echo "$module_default"
      exit 0
    fi
  elif [ -f "$module" ] || [ $load_default_silently -eq 0 ]; then
    echo "$module"
  else
    echo "$module_default"
  fi
}
