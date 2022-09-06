HELO. WELCOME. PLZ USE THESE SCRIPTS TO MAKE YOUR DECK BIGGER, FASTER, HARDER, STRONGER@!

# trav-scripts Options

- `Post Update Init`: Reinstalls apps that are specified in the $PACKAGES var after steamos update. Adjusts a few other settings.
- `Install Dev Tools`: Warning: You should only install these if you know what you are doing. Its easy to brick your device using this option, especially if you don't have enough space available. This will install most tools that are required to build packages from source; glibc, libdrm, ect. It will also reinstall any package files that were stripped by Valve to save space, that would otherwise be useful for development.
- `SSHd Configuration`: Sets up SSHd for use.
- `Setup UFW`: Sets up UFW Firewall.
- `Fix Lutris Flatpak`: Fixes problem with flatpak version of lutris.
- `Backup Packages` and `Restore Packages`: Backup and restore for pacman and flatpak packages.
- `BTRFS Utilities`: Made to be used with: https://gitlab.com/popsulfr/steamos-btrfs/. Uses Deduplication and btrfs balancing capabilities to save space.
- `Setup Joycon Cfgs`: This setups the required drivers to make Nintendo Switch Joycon controllers work with Steamdeck.
- `Kill Windows Emus`: Kills any stuck(or unstuck) windows emulators.

# Install

1. Open Desktop mode, Open up Konsole and set a password for the deck user: `passwd`

NOTE: At this point, do yourself a favor and `sudo systemctl enable sshd --now` so that you can ssh in and stop using that shit steamos keyboard.  

2. `sudo steamos-readonly disable;sudo pacman-key --init;sudo pacman-key --populate archlinux`

3. `mkdir -p ~/.local`

4. `git clone https://github.com/TheRealAlexV/steamdeck-scripts.git ~/.local/trav-steamdeck-scripts`

5. Put the following in your `~/.bash_profile`:
```
export PATH="$PATH:$HOME/.local/trav-steamdeck-scripts"
```

NOTE: If you change the location of the scripts from $HOME/.local/trav-steamdeck-scripts, be sure to update the config.sh file with the new path.

# Usage

Open the terminal or ssh session and use the `trav-scripts` command to bring up the main menu.

# Thanks!

gitlab.com/popsulfr for his amazing gitlab.com/popsulfr/steamos-btrfs BTRFS conversation scripts.