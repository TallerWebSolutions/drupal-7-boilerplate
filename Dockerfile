 FROM ubuntu:14.04
 MAINTAINER Edmar <edmar.gomes@taller.net.br>, Handrus <handrus@taller.net.br>, Renato Gomes <renato@taller.net.br>
 # Supress errors about bash not being interactive
 ENV DEBIAN_FRONTEND noninteractive
 # Install ansible.
 RUN apt-get install -y software-properties-common
 RUN apt-add-repository ppa:ansible/ansible
 RUN apt-get -y update
 RUN apt-get install -y python-yaml python-jinja2 git ansible
 # Add ansible files and run it.
 ADD configs/servers/ /tmp/servers/
 WORKDIR /tmp/servers/
 RUN ansible-playbook playbook.yaml -c local -i inventory.local -vvvv
 EXPOSE 22 80 3306
