PROJECT_ROOT=$(shell pwd)
ACTIONS_DIR="$(PROJECT_ROOT)/src/make-actions"
SETTINGS_CONF_FILE_PATH="$(PROJECT_ROOT)/settings.local.conf"

install: rekeygen update-system-clock

rekeygen:
	@chmod +x "$(ACTIONS_DIR)/ssh-rekeygen.sh"
	@"$(ACTIONS_DIR)/ssh-rekeygen.sh" "$(SETTINGS_CONF_FILE_PATH)"

update-system-clock:
	@chmod +x "$(ACTIONS_DIR)/update-system-clock.sh"
	@"$(ACTIONS_DIR)/update-system-clock.sh" "$(SETTINGS_CONF_FILE_PATH)"
