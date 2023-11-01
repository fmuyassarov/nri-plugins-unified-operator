FROM quay.io/operator-framework/ansible-operator:v1.32.0

COPY requirements.yml ${HOME}/requirements.yml
RUN ansible-galaxy collection install -r ${HOME}/requirements.yml \
 && chmod -R ug+rwx ${HOME}/.ansible

COPY watches.yaml ${HOME}/watches.yaml
COPY helm /usr/local/bin/
COPY roles/ ${HOME}/roles/
COPY playbooks/ ${HOME}/playbooks/
