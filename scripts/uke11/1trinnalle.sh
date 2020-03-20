
#!/bin/bash
#Kjøres på alle servere
sudo apt-get -y install glusterfs-server glusterfs-client
sudo systemctl enable glusterd
sudo systemctl start glusterd
sudo mkdir /bf_brick -v
sudo mkdir /bf_config_brick -v
# Vi lager også to mapper som blir der vi "mounter" de distribuerte filsystemene. Det er disse mappene vi så skal bruke. 
sudo mkdir /bf_images -v
sudo mkdir /bf_config -v
