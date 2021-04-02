#!/usr/bin/env bash
set -eu -o pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

if [[ -d .py_venv ]]; then
    source ".py_venv/bin/activate"
else
    python3 -m venv .py_venv
    source ".py_venv/bin/activate"
    pip install --upgrade pip setuptools ansible
fi

(
    cd $SCRIPT_DIR
    ansible-galaxy role install --role-file requirements.yml --roles-path roles_external --force-with-deps
    ansible-playbook \
        --inventory "$HOSTNAME", \
        --extra-vars "ansible_connection=local arch_user=$(whoami)" \
        --ask-become-pass \
        playbook.yml -v
)

deactivate
