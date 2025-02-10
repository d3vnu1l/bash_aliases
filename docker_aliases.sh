#!/usr/bin/env bash

alias dcrm="docker container rm"
alias dils="docker image ls"
alias dirm="docker image rm"
dpa() {
  echo "Docker pull all."
  for image in $(docker images --format "{{.Repository}}"); do docker pull "$image"; done
}
alias dps="docker ps"
alias dsp="docker system prune"
alias dvp="docker volume prune"

