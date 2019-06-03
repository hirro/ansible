# NGINX
ansible-playbook -i ../production.ini rancher-servers.yml --tags="nginx"

ansible-playbook -i ../production.ini rancher-servers.yml --tags="unifi-controller"
