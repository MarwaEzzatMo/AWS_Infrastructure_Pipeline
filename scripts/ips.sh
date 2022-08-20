#!/bin/bash
pwd
sed -i "s#HostName.*#HostName $(terraform -chdir=./terraform output --raw instance_public)#" /var/jenkins_home/.ssh/config
sed -i "s/.*ansible_host.*/ansible_host: $(terraform -chdir=./terraform output --raw instance_private)/" ./ansible/group_vars/slave      
sed -i "s#proxy_pass.*#proxy_pass http://$(terraform -chdir=./terraform output --raw instance_private):3000;#" ./ansible/files/nginx.conf










# sed -i 's#HostName.*#HostName ${self.public_ip}#' /var/jenkins_home/.ssh/config
# sed -i 's/.*ansible_host.*/ansible_host: ${self.private_ip}/' ../ansible/group_vars/slave      
# sed -i 's#proxy_pass.*#proxy_pass http://${self.private_ip}:3000;#' ../ansible/files/nginx.conf