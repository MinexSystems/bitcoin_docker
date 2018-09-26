# bitcoin_docker

Compile bitcoin in Docker container
---------------------------------------
Check out the source code in the following directory hierarchy.

    cd /path/to/your/toplevel/build
    git clone https://github.com/bitcoin/bitcoin.git
    git clone https://github.com/bitcoin/bitcoin_docker.git

Check out to tag version:
   
    cd bitcoin/
    git fetch origin --tags
    git checkout tags/<tag_name>
    cd ../
   
Run build script for any system in folder build. For example
    
        ./bitcoin_docker/build/ubuntu14.04-linux.sh
        
After build compilation log will be placed into folder logs and binary files places into out folder
    

