# zen-browser-linux-installer

Install [Zen](https://zen-browser.app), "the best way to browse the web"
ALL CREDIT TO [NEUNER](https://codeberg.org/neuner/zen-linux.sh), the creator of the original [project](https://codeberg.org/neuner/zen-linux.sh). (The original project is also probably safer, since I am not experienced)

#### Differences from original:

- removes temporary files completely
- allows for generic install
- removes need for uuidgen

## Getting started

To install zen, you just need to download & run [zen-linux.sh](./zen-linux.sh)

```bash
wget https://raw.githubusercontent.com/tranquil-tr0/zen-browser-linux-installer/refs/heads/main/zen-linux.sh
chmod +x zen-linux.sh

# yay, now you can use the script!
# NOTE: you need the following if not in your distro:
# wget, curl, bash (probably, untested on sh), tar
./zen-linux.sh install
```

## Commands:

### install [location]

installs Zen to the specified location, or the default one (~/.zen/browser)

### install generic

installs Zen as detailed above, but with the generic files if your hardware does not support AVX2 or other compatability issue

### install [location] generic

installs Zen as detailed in generic, but at the location in the location section

### uninstall [location]

removes Zen from the specified location, or the default one (~/.zen/browser)

Note: this will keep your data should you wish to return or move it

### desktop [location]

attempts to create a desktpp entry for the specified installation of Zen, or the default one (~/.zen/browser)

### help

help

## Issues:

report in issues tab
and/or
try commands or whole program from original project (referenced above)
