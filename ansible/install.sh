#!/bin/bash

# Definieren des Pfads zum Ansible-Playbook
PLAYBOOK_PATH="./install.yml"

# Prüfen, ob Ansible installiert ist
if ! command -v ansible > /dev/null; then
    echo "Ansible ist nicht installiert. Beginne mit der Installation..."
    sudo dnf install -y ansible
    if [ $? -ne 0 ]; then
        echo "Fehler bei der Installation von Ansible."
        exit 1
    fi
    echo "Ansible wurde erfolgreich installiert."
else
    echo "Ansible ist bereits installiert."
fi

# Ausführen des Ansible-Playbooks
echo "Führe das Ansible-Playbook aus: $PLAYBOOK_PATH"
ansible-playbook "$PLAYBOOK_PATH" --ask-become-pass

if [ $? -ne 0 ]; then
    echo "Fehler bei der Ausführung des Ansible-Playbooks."
    exit 1
else
    echo "Ansible-Playbook wurde erfolgreich ausgeführt."
fi

