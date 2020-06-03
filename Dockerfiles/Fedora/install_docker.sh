curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh && rm get-docker.sh
# And modify permission (lab's docker gid: 4001)
groupmod -g 4001 docker && usermod -aG docker ${CUST_USER}