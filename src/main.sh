#!/usr/bin/sh
#
# Usage:
#   ./main.sh <settings_file.conf>
#
# Parameters:
#   $1 - file with global constants definitions. Default is './settings.conf'
#

set -e

source './src/util/import-utils.sh'
source './src/util/ssh-utils.sh'
source './src/update-system-clock.sh'

# Loading .conf file:
source $(get_module $1 './settings.conf')

ssh_rekeygen
update_system_clock
