#!/usr/bin/env bash

alias dcrm="docker container rm"
alias dils="docker image ls"
alias dirm="docker image rm"
dpa() {
  echo "Docker pull all."
  for image in $(docker images --format "{{.Repository}}"); do docker pull "$image"; done
}
alias dp="docker ps"
alias dpg="docker ps | grep"
alias dsp="docker system prune"
alias dvp="docker volume prune"
alias da="docker attach"
alias de="docker exec"
alias dei="docker exec -it"
deib() { docker exec -it "$@" bash; }
alias dr="docker run"
alias dri="docker run -it"
drib() { docker run -it "$@" bash; }
