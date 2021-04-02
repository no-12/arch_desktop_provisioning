#!/usr/bin/env bash
set -eu -o pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

if [[ -d .python_venv ]]; then
    source ".python_venv/bin/activate"
else
    python3 -m venv .python_venv
    source ".python_venv/bin/activate"
    pip install --upgrade pip
    pip install --upgrade ansible
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
