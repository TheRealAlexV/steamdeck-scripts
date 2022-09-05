#!/bin/bash
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SCRIPTDIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
. $SCRIPTDIR/config.sh

sudo echo "sudoed"
sudo steamos-readonly disable
tmpfile="/tmp/authkeys.$$"

sudo sed -i -e 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config
sudo sed -i -e 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
sudo sed -i -e 's/#X11Forwarding no/X11Forwarding yes/g' /etc/ssh/sshd_config

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
  cat $tmpfile | sudo tee /root/.ssh/authorized_keys
  echo ""| sudo tee -a /root/.ssh/authorized_keys
  sudo chmod 700 /root/.ssh
  sudo chmod 644 /root/.ssh/authorized_keys
  
  mkdir -p $DECKHOME/.ssh
  touch $DECKHOME/.ssh/authorized_keys
  echo "Too the deck user:"
  cat $tmpfile | tee $DECKHOME/.ssh/authorized_keys
  echo ""| tee -a $DECKHOME/.ssh/authorized_keys
  sudo chmod 700 $DECKHOME/.ssh
  sudo chmod 644 $DECKHOME/.ssh/authorized_keys
  sudo chown deck:deck $DECKHOME/.ssh -R
else
  echo "Couldn't get any keys, or you left the key user blank." >&2
fi

sudo rm $tmpfile

echo "Setting up services"
sudo systemctl enable "$SCRIPTDIR/3_sshd/ssh-inhibit-sleep.service"
sudo systemctl enable "$SCRIPTDIR/3_sshd/sleep-recover-pipewire.service"

sudo systemctl enable sshd
sudo systemctl start sshd
sudo steamos-readonly enable