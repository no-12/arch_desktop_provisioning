#!/usr/bin/env bash
set -eu

# ansible-galaxy role install --role-file requirements.yml --roles-path roles_external --force-with-deps
ansible-playbook \
    --inventory "$HOSTNAME", \
    --extra-vars "ansible_connection=local arch_user=$(whoami)" \
    --ask-become-pass \
    provisioning_user.yml -v
