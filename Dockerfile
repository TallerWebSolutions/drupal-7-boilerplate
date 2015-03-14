 FROM ubuntu:12.04
 MAINTAINER Edmar <edmar.gomes@taller.net.br>, Handrus <handrus@taller.net.br>, Renato Gomes <renato@taller.net.br>
 RUN apt-get install -y python-software-properties
 RUN apt-add-repository ppa:ansible/ansible
 RUN apt-get -y update
 RUN apt-get install -y python-yaml python-jinja2 git ansible
 #RUN git clone http://github.com/ansible/ansible.git /tmp/ansible
 #WORKDIR /tmp/ansible
 #ENV PATH /tmp/ansible/bin:/sbin:/usr/sbin:/usr/bin
 #ENV ANSIBLE_LIBRARY /tmp/ansible/library
 #ENV PYTHONPATH /tmp/ansible/lib:$PYTHON_PATH
 #Must run docker with
 ADD configs/servers/ /tmp/servers/
 WORKDIR /tmp/servers/
 RUN ansible-playbook playbook.yaml -c local -i inventory.local -vvvv
 EXPOSE 22 80