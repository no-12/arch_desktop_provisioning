#!/usr/bin/env bash
set -eu -o pipefail

python3 -m venv .py_venv
source ".py_venv/bin/activate"
pip install -U pip pylint autopep8 ranger-fm
deactivate
