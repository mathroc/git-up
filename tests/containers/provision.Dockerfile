FROM ansible/ubuntu14.04-ansible:stable

ADD roles/ /srv/playbooks/roles/
ADD tests/containers/provision.yml /srv/playbooks/playbook.yml

WORKDIR /srv/playbooks/

RUN ansible-playbook playbook.yml -c local

ADD tests/containers/workstation.id_rsa.pub /path/to/gitolite/keys/karin@id_rsa.pub
