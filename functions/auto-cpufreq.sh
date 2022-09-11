#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable

if [ ! -f "/etc/sudoers.d/zzz-auto-cpufreq"  ]
then
  PKGVERSION=1.9.6

  cd $HOME
  wget https://github.com/AdnanHodzic/auto-cpufreq/archive/refs/tags/v$PKGVERSION.tar.gz
  tar -zxf v$PKGVERSION.tar.gz
  rm -rf v$PKGVERSION.tar.gz
  cd auto-cpufreq-$PKGVERSION
  ln -s "$HOME/auto-cpufreq-$PKGVERSION" "$HOME/.local/usr"
  python -m ensurepip --upgrade
  python -m pip install --upgrade pip
  python -m pip install distro
  sed -i 's|^\([^#].*\)/usr/\(local/\)\?|\1'"$HOME"'/.local/|g' auto_cpufreq/core.py
  python setup.py build
  python setup.py install --root="$HOME/.local" --optimize=1 --skip-build
  install -Dm755 scripts/cpufreqctl.sh -t "$HOME/.local/share/auto-cpufreq/scripts"

  cat << 'END_OF_FILE' | tee $HOME/.config/auto-cpufreq.conf
  [charger]
  governor = schedutil

  [battery]
  governor = schedutil

END_OF_FILE

  sudo mkdir -p "$HOME/.config/environment.d"

  cat << 'END_OF_FILE' | tee $HOME/.config/environment.d/envvars.conf
  PATH="$PATH:$HOME/.local/bin"

END_OF_FILE

  echo "$USER ALL=(ALL) NOPASSWD:SETENV: $HOME/.local/bin/auto-cpufreq *" | sudo tee -a /etc/sudoers.d/zzz-auto-cpufreq
  sudo chmod 0440 /etc/sudoers.d/zzz-auto-cpufreq

  systemctl --user enable "$INCLUDES/auto-cpufreq/auto-cpufreq.service"

  sudo steamos-readonly enable
fi

systemctl --user start auto-cpufreq
auto-cpufreq --stats&sleep 3;kill -9 $(pgrep -f "/home/deck/.local/bin/auto-cpufreq --stats");echo 