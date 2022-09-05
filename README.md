# Steamdeck Script Commands

- `1_post-update-init.sh`: Reinstalls apps that are specified in the $PACKAGES var after steamos update. Adjusts a few other settings.
- `2_install-dev-tools.sh`: This will install most tools that are required to build packages from source; glibc, libdrm, ect. It will also reinstall any package files that were stripped by Valve to save space, that would otherwise be useful for development.
- `2_sshd.sh`: Sets up SSHd for use.
- `2_ufw.sh`: Sets up UFW Firewall.
- `2_fix_lutris`: Fixes problem with flatpak version of lutris.
- `2_backup_packages.sh` and `2_restore_packages.sh`: Backup and restore for pacman and flatpak packages.
- `3_btrfs-optimize.sh`: Made to be used with: https://gitlab.com/popsulfr/steamos-btrfs/. Uses Deduplication and btrfs balancing capabilities to save space.
- `3_joycons.sh`: This setups the required drivers to make Nintendo Switch Joycon controllers work with Steamdeck.

# Install

1. Open Desktop mode, Open up Konsole and set a password for the deck user: `passwd`

2. `sudo steamos-readonly disable;sudo pacman-key --init;sudo pacman-key --populate archlinux`

3. `mkdir -p ~/.local`

4. `git clone https://github.com/TheRealAlexV/steamdeck-scripts.git ~/.local/steamdeck-scripts`

5. Put the following in your `~/.bash_profile`:
```
export PATH="$PATH:$HOME/.local/steamdeck-scripts"
```

NOTE: If you change the location of the scripts from $HOME/.local/steamdeck-scripts, be sure to update the config.sh file with the new path.

6. You may now use any of the Steamdeck script commands from the `Steamdeck Script Commands` section above.
