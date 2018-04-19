#!/bin/bash
set -ex
PACKAGENAME=${1:? PACKAGENAME not found}
VERSION=${2:? VERSION not found}

time ( cd $(dirname $0)/..
  # Create ansible.cfg with correct roles_path
  printf '[defaults]\nroles_path=../' >ansible.cfg

  test -x "$(type -p ansible-lint)" && ansible-lint  -v tests/test.yml
#-x ANSIBLE0010

  echo "ansible syntax-check"
  ansible-playbook -c local -ilocalhost, \
     -e "role_name=${PACKAGENAME}-${VERSION}" \
     tests/test.yml -v \
    --syntax-check

  echo "ansible list-tasks"
  ansible-playbook -c local -ilocalhost, \
     -e "role_name=${PACKAGENAME}-${VERSION}" \
     tests/test.yml -v \
    --list-tasks
)

