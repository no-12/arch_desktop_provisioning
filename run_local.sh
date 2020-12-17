#!/usr/bin/env bash
ansible-galaxy role install --role-file requirements.yml --roles-path roles_external --force-with-deps
ansible-playbook -v -i "$HOSTNAME", -e ansible_connection=local --ask-become-pass playbook.yml
