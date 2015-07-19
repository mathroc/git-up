FROM ansible/ubuntu14.04-ansible:1.7

RUN ansible --version

ADD roles/ /srv/playbooks/roles/
ADD tests/containers/deployable.yml /srv/playbooks/playbook.yml

WORKDIR /srv/playbooks/

RUN ansible-playbook playbook.yml -c local
