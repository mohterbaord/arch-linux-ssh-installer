function ssh_rekeygen() {
  # Required global variables:
  #
  # - SSH_HOST
  #
  ssh-keygen -R $SSH_HOST
}

function ssh_cmd_exec() {
  # Required global variables:
  #
  # - SSH_HOST
  # - SSH_PORT
  # - SSH_USERNAME
  # - SSH_PASSWORD

  # Parameters:
  local cmd=$1

  sshpass -p "$SSH_PASSWORD" ssh \
    -o ConnectTimeout=10 \
    -o StrictHostKeyChecking=no \
    -l $SSH_USERNAME \
    -p $SSH_PORT \
    "$SSH_HOST" \
    "$cmd"
}
