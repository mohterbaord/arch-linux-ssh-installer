#!/usr/bin/sh
#
# Usage:
#   ./src/make-actions/ssh-rekeygen.sh <settings_file.conf>
#
# Parameters:
#   $1 - file with global constants definitions. Default is './settings.conf'
#

set -e

source './src/util/import-utils.sh'
source './src/util/ssh-utils.sh'

# Loading .conf file:
source $(get_module "$1" './settings.conf' 1)

ssh_rekeygen
