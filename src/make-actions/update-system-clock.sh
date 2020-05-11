#!/usr/bin/sh
#
# Usage:
#   ./update-system-clock.sh <settings_file.conf>
#
# Parameters:
#   $1 - file with global constants definitions. Default is './settings.conf'
#

set -e

source './src/util/import-utils.sh'
source './src/util/ssh-utils.sh'
source './src/util/update-system-clock-utils.sh'

# Loading .conf file:
source $(get_module "$1" './settings.conf' 1)

ssh_rekeygen
update_system_clock
