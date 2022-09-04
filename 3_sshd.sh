#!/bin/bash
tmpfile="/tmp/authkeys.$$"

sudo sed -i 's\#PermitRootLogin prohibit-password\PermitRootLogin without-password\g' /etc/ssh/sshd_config

echo "Please enter a github user account to add it's SSH key to the root authorized_keys file." >&2
echo "Leave this blank if you don't want to use an ssh key." >&2
read -r githubuser
keycomment="github:${githubuser}"
curl -s https://github.com/${githubuser}.keys >$tmpfile

if [[ $( stat -c'%s' $tmpfile ) -gt 1 ]]; then
  sed -i -e "s/$/ ${keycomment}/" $tmpfile
  
  sudo mkdir -p /root/.ssh
  sudo touch /root/.ssh/authorized_keys
  echo "Too the root user:"
  cat $tmpfile | sudo tee -a /root/.ssh/authorized_keys
  echo ""| sudo tee -a /root/.ssh/authorized_keys
  
  mkdir -p /home/deck/.ssh
  touch /home/deck/.ssh/authorized_keys
  echo "Too the deck user:"
  cat $tmpfile | tee -a /home/deck/.ssh/authorized_keys
  echo ""| tee -a /home/deck/.ssh/authorized_keys
  sudo chown deck:deck /home/deck/.ssh -R
else
  echo "Couldn't get any keys, or you left the key user blank." >&2
fi

rm $tmpfile

sudo systemctl enable sshd
sudo systemctl start sshd
