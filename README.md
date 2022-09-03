# Steamdeck Script Commands

- `1_mkwritable.sh`: This script makes the Steamdeck system partition writable and updates the pacman keychain for first use. This should be run first before the other scripts.
- `2_install-dev-tools.sh`: This will install most tools that are required to build packages from source; glibc, libdrm, ect.
- `3_dedupe.sh`: For use with: https://gitlab.com/popsulfr/steamos-btrfs/. Uses Deduplication capabilities to save space.
- `3_joycons.sh`: This setups the required drivers to make Nintendo Switch Joycon controllers work with Steamdeck.

# Install

1. Open Desktop mode, Open up Konsole and set a password for the deck user: `passwd`

2. `mkdir -p ~/.local`

3. `git clone git@github.com:TheRealAlexV/steamdeck-scripts.git ~/.local/steamdeck-scripts`

4. Put the following in your `~/.bash_profile`:
```
export PATH="$PATH:$HOME/.local/steamdeck-scripts"
```

5. You may now use any of the Steamdeck script commands from the `Steamdeck Script Commands` section above.
