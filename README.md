### INFO

When your gitolite image is built you want to seed it with a public key to use as first user. This user has access to administer gitolite. For that reason you need to build your own gitolite image. I could build one with my key, publish it to the registry and you could use that if you'd like me to admin your box for you.

### HOWTO

    cp ~/.ssh/id_rsa.pub .
    sudo docker build -t gitolite
        
