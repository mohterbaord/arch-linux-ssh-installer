source './src/util/ssh-utils.sh'

_OUTPUT_NTP=''
_OUTPUT_NTP_SYNCHRONIZED=''

function _write_timedatectl_status() {
  local output_tmp_file=$(mktemp)
  local cmd_show='timedatectl show --property=NTP --property=NTPSynchronized'
  ssh_cmd_exec "$cmd_show" \
    > $output_tmp_file

  _OUTPUT_NTP=$(cat $output_tmp_file | head -1 | sed -e 's/NTP=//')
  if [ "$_OUTPUT_NTP" == 'yes' ]; then
    _OUTPUT_NTP=true
  else
    _OUTPUT_NTP=false
  fi

  _OUTPUT_NTP_SYNCHRONIZED=$(cat $output_tmp_file | head -2 | tail -1 | sed -e 's/NTPSynchronized=//')
  if [ "$_OUTPUT_NTP_SYNCHRONIZED" == 'yes' ]; then
    _OUTPUT_NTP_SYNCHRONIZED=true
  else
    _OUTPUT_NTP_SYNCHRONIZED=false
  fi

  rm $output_tmp_file
}

function update_system_clock() {
  _write_timedatectl_status

  if [ $_OUTPUT_NTP == false ] || [ $_OUTPUT_NTP_SYNCHRONIZED == false ]; then
    local cmd_set_ntp='timedatectl set-ntp true'
    ssh_cmd_exec "$cmd_set_ntp"

    _write_timedatectl_status

    if [ $_OUTPUT_NTP == true ] && [ $_OUTPUT_NTP_SYNCHRONIZED == true ]; then
      return 0
    else
      return 1
    fi
  else
    return 0
  fi
}
