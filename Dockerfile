 FROM ubuntu:12.04
 MAINTAINER Edmar <edmar.gomes@taller.net.br>, Handrus <handrus@taller.net.br>, Renato Gomes <renato@taller.net.br>
 RUN apt-get -y update
 RUN apt-get install -y python-yaml python-jinja2 git
 RUN git clone http://github.com/ansible/ansible.git /tmp/ansible
 WORKDIR /tmp/ansible
 ENV PATH /tmp/ansible/bin:/sbin:/usr/sbin:/usr/bin
 ENV ANSIBLE_LIBRARY /tmp/ansible/library
 ENV PYTHONPATH /tmp/ansible/lib:$PYTHON_PATH
 VOLUME ["./:/var/www/drupal/:rw"]
 ADD configs/ansible/inventory/hosts /etc/ansible/hosts
 WORKDIR /var/www/drupal/configs/ansible
 #Test till here.
 RUN ansible-playbook site.yml -c local
 EXPOSE 22 3000
 ENTRYPOINT [“/usr/bin/foo”]