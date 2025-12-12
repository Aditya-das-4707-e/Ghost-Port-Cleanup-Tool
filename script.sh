# port task remove

# check what's using the port
sudo ss -ltnp | grep <port_number>

# example output
users:(("docker-proxy",pid=2550,fd=7))
# kill it
sudo kill -9 <pid_number>

# always restart docker to clean all safe port mappings

sudo systemctl restart docker
