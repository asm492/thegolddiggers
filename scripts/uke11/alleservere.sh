
#!/bin/bash
#Kjøres på alle servere
sudo apt-get -y install glusterfs-server glusterfs-client
sudo systemctl enable glusterd
sudo systemctl start glusterd
mkdir /bf_brick
mkdir /bf_config_brick
# Vi lager også to mapper som blir der vi "mounter" de distribuerte filsystemene. Det er disse mappene vi så skal bruke. 
mkdir /bf_images
mkdir /bf_config
