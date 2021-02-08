#!/bin/sh

ansible-playbook --ask-vault-pass --extra-vars @milab-secrets $@

