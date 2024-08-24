# zen-linux.sh

Install [Zen](https://zen-browser.app), "the best way to browse the web" faster than you can say antidisestablishmentarianism

## Getting started

To install zen, you just need to download & run [zen-linux.sh](./zen-linux.sh)

```bash
wget https://codeberg.org/neuner/zen-linux.sh/raw/branch/main/zen-linux.sh
chmod +x zen-linux.sh

# yay, now you can use the script!
# NOTE: you need the following if not in your distro:
# wget, curl, bash (probably, untested on sh), uuidgen, tar
./zen-linux.sh install
```

## Commands:

### install [location]

installs Zen to the specified location, or the default one (~/.zen/browser)

### uninstall [location]

removes Zen from the specified location, or the default one (~/.zen/browser)

Note: this will keep your data should you wish to return or move it

### desktop [location]

attempts to create a desktpp entry for the specified installation of Zen, or the default one (~/.zen/browser)

### help

well, you know, help