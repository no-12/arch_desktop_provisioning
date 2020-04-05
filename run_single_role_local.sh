#!/usr/bin/env bash
set -eu
ansible-playbook -v -i "$HOSTNAME", -e ansible_connection=local -e single_role="$1" --ask-become-pass playbook_single_role.yml
