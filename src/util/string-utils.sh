function trim() {
  local value=$1
  echo "$value" \
    | sed -e 's/^[ \t\n]*//' -e 's/[ \t\n]*$//'
}
