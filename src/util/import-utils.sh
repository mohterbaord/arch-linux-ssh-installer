source './src/util/string-utils.sh'

function get_module() {
  # Echoes a module path or default.
  #
  # Useful for dynamic module importing via `source` command.
  #
  # Exits with 22 error code if both `module` and `module_default` parameters
  # are empty after trimming.

  # Parameters:
  local module=$(trim "$1")
  local module_default=$(trim "$2")

  if [ -z "$module" ]; then
    if [ -z "$module_default" ]; then
      exit 22
    elif [[ "$module_default" != ./* ]]; then
      module="./$module_default"
    fi
  elif [[ "$module" != ./* ]] && [[ "$module" != /* ]]; then
    module="./$module"
  fi

  echo "$module"
}
