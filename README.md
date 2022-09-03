# Steamdeck Script Commands

- `post-update.sh`: This script does a few things and is meant to be run every time a SteamOS update is installed. This will re-implement any changes that were overwritten by the SteamOS Update. Mainly makes the system partition writable again, re-inits pacman keys and starts the SSH service. You will still need to `passwd` the deck user though.
- `dedupe.sh`: For use with: https://gitlab.com/popsulfr/steamos-btrfs/. Uses Deduplication capabilities to save space.
- `joycons.sh`: This setups the required drivers to make Nintendo Switch Joycon controllers work with Steamdeck.

# Install

1. `mkdir -p ~/.local`

2. `git clone git@github.com:TheRealAlexV/steamdeck-scripts.git ~/.local/steamdeck-scripts`

3. Put the following in your `~/.bash_profile`:
```
export PATH="$PATH:$HOME/.local/steamdeck-scripts"
```

4. You may now use any of the Steamdeck script commands from the `Steamdeck Script Commands` section above.
