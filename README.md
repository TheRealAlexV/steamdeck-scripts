# Steamdeck Script Commands

- `1_mkwritable.sh`: This script makes the Steamdeck system partition writable and updates the pacman keychain for first use. This should be run first before the other scripts.
- `2_install-dev-tools.sh`: This will install most tools that are required to build packages from source; glibc, libdrm, ect.
- `3_dedupe.sh`: For use with: https://gitlab.com/popsulfr/steamos-btrfs/. Uses Deduplication capabilities to save space.
- `joycons.sh`: This setups the required drivers to make Nintendo Switch Joycon controllers work with Steamdeck.

# Install

1. `mkdir -p ~/.local`

2. `git clone git@github.com:TheRealAlexV/steamdeck-scripts.git ~/.local/steamdeck-scripts`

3. Put the following in your `~/.bash_profile`:
```
export PATH="$PATH:$HOME/.local/steamdeck-scripts"
```

4. You may now use any of the Steamdeck script commands from the `Steamdeck Script Commands` section above.
