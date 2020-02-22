#!/usr/bin/env bash
ansible-playbook -v -i "$HOSTNAME", -e ansible_connection=local --ask-become-pass playbook.yml
