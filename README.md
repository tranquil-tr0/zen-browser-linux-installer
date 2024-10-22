# A Zen Browser installer, for Linux distros without the AUR

Install [Zen](https://zen-browser.app), "the best way to browse the web" in Linux, without using the Appimage or Flatpak! For other options, see the [alternatives](##Alternatives (untested, I also can't help with these)) section below
ALL CREDIT TO [NEUNER](https://codeberg.org/neuner/zen-linux.sh), the creator of the original [project](https://codeberg.org/neuner/zen-linux.sh), and the [Zen](https://zen-browser.app/) team!

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

## Alternatives (untested, I also can't help with these):

If you are running Arch, use the AUR
If you do not like this method of installing, feel free to use
- [pacstall](https://pacstall.dev/) to install the [generic](https://pacstall.dev/packages/zen-browser-generic-bin) or [optimized](https://pacstall.dev/packages/zen-browser-specific-bin) version of the browser
- the [zen](https://github.com/zen-browser/desktop) releases page to find the flatpak or appimage file
- the original [installer](https://codeberg.org/neuner/zen-linux.sh) (very similar to this script)

#### Differences from original:

- removes temporary files completely after installation
- allows for generic install
- removes need for uuidgen by moving to home
- fixed an echo line to improve clarity
- allows removal of user data when uninstalling
