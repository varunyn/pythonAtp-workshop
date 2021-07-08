#!/bin/bash

cd /home/opc
cp -r /tmp/lab-resources .
mkdir .vnc
echo $1|vncpasswd -f > /home/opc/.vnc/passwd
chown -R opc:opc /home/opc/.vnc
chmod 600 /home/opc/.vnc/passwd

# Firewall
sudo firewall-cmd --permanent --zone=public --add-port=5901/tcp
sudo firewall-cmd --reload

# setup and start vnc
# vncserver :1

sudo -u root cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@\\:01.service
sudo -u root sed -i 's/<USER>/opc/g' /etc/systemd/system/vncserver@\\:01.service
sudo -u root systemctl daemon-reload
sudo -u root systemctl enable vncserver@\\:01.service
sudo -u root systemctl start vncserver@\\:01.service


sudo sh -c "echo /usr/lib/oracle/21/client64/lib > /etc/ld.so.conf.d/oracle-instantclient.conf"
sudo ldconfig
export LD_LIBRARY_PATH=/usr/lib/oracle/21/client64/lib:$LD_LIBRARY_PATH

# sudo mkdir /etc/systemd/system/vncserver@.service.d
# sudo touch /etc/systemd/system/vncserver@.service.d/10-restart.conf
# sudo su
# echo 'Restart=always' > /etc/systemd/system/vncserver@.service.d/10-restart.conf

# sudo systemctl daemon-reload
# sudo systemctl enable --now vncserver@:1.service

# sudo systemctl restart vncserver@:1.service

echo "Developer Workshop Available"

# sudo reboot
