#!/bin/bash

# Licensed MIT
# Open source @ https://codeberg.org/neuner/zen-linux.sh
# support zen: https://ko-fi.com/zen_browser

default_install_location="$HOME/.zen/browser"
zen_install="${2-$default_install_location}"

zen_download_file="zen.linux-specific.tar.bz2"
    if [ "$2" == "generic" ]; then
        zen_download_file="zen.linux-generic.tar.bz2"
        zen_install="$default_install_location"
        echo "Using generic files, WARNING: these are not recommended for newer systems!!"
    fi
zen_release_tag="$(curl -s https://api.github.com/repos/zen-browser/desktop/releases/latest | jq -r ".tag_name")"
zen_download_tarball="https://github.com/zen-browser/desktop/releases/download/$zen_release_tag/$zen_download_file"

echo "Using release tagged $zen_release_tag (dl: $zen_download_tarball)"

# Define functions for different commands
function install {
    if [ -d "$zen_install" ]; then
        echo "A Zen install already exists at $zen_install. Please remove it before installing Zen."
        exit 1
    fi

    echo "===== Installing Zen: temporary directory made at ~/build"
    mkdir -p "~/build"
    temp_dir="~/build/$(uuidgen)"
    mkdir -p "$temp_dir/content"
    # zen does not exist at the location
    echo "===== Downloading zen to $temp_dir/zen.tar.bz2"
    wget -O "$temp_dir/zen.tar.bz2" "$zen_download_tarball"

    echo "===== Extracting zen to $temp_dir/content"
    tar -xvjf "$temp_dir/zen.tar.bz2" -C "$temp_dir/content"

    # sanity check
    if [ ! -d "$temp_dir/content/zen" ]; then
        echo "Something went wrong when downloading zen. It isn't present in $temp_dir/content/zen"
        exit 1
    fi

    mkdir -p "$zen_install"

    echo "===== Moving zen install to $zen_install"
    mv $temp_dir/content/zen/** "$zen_install/"

    echo "===== Removing temporary directory"
    rm -rf "$temp_dir"

    echo "=========================================="
    echo "===== Zen is installed!"
    echo "To make a desktop entry (so zen will appear on your system's navigation) use $0 desktop"
    echo "To use open zen in terminals, use:"
    echo "PATH=$PATH:$zen_install/zen"
}

function uninstall {
    if [ -d "$zen_install" ]; then
        echo "Zen install exists. Removing it!"
        rm -rfv $zen_install
    else
        echo "Zen does not exist at $zen_install"
        exit 1
    fi
}

function desktop {
    if [ ! -d "$zen_install" ]; then
        echo "Zen does not exist at $zen_install"
        exit 1
    fi

    if [ ! -d "$HOME/.local/share/applications" ]; then
        echo "~/.local/share/applications doesn't exist. You may have to proceed manually!"
    fi

    temp_dir="/tmp/$(uuidgen)"
    mkdir -p "$temp_dir"

    touch "$temp_dir/zen.desktop"
    echo "[Desktop Entry]" >> "$temp_dir/zen.desktop"
    echo "Version=1.0" >> "$temp_dir/zen.desktop"
    echo "Name=Zen" >> "$temp_dir/zen.desktop"
    echo "Comment=The best way to browse the web" >> "$temp_dir/zen.desktop"
    echo "Exec=$zen_install/zen" >> "$temp_dir/zen.desktop"
    echo "Icon=$zen_install/browser/chrome/icons/default/default128.png" >> "$temp_dir/zen.desktop"
    echo "Terminal=false" >> "$temp_dir/zen.desktop"
    echo "Type=Application" >> "$temp_dir/zen.desktop"
    echo "Categories=Network;WebBrowser;Internet;Utility;" >> "$temp_dir/zen.desktop"
    echo "" >> "$temp_dir/zen.desktop"

    mv "$temp_dir/zen.desktop" "$HOME/.local/share/applications/"
    rm -rfv "$temp_dir"

    chmod +x "$HOME/.local/share/applications/zen.desktop"

    # refresh desktop environment
    update-desktop-database "$HOME/.local/share/applications/"

    echo "Successfully added Zen to your desktop entries!"
}

function help {
    echo "help:"
    echo "  install [location]   -- installs the latest version of Zen to the specified directory"
    echo "  install generic   -- installs Zen as detailed above, but with the generic files"
    echo "  uninstall [location] -- removes Zen installation (but not data) from your system"
    echo "  desktop [location] -- creates a desktop entry for your Zen installation"
    echo "  help -- you should know what this does since you're here :)"
    echo ""
    echo "note: location defaults to ~/.zen/browser if unspecified"
}

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    help
    exit 1
fi

# Get the command and the argument
command=$1

case $command in
    install)
        install $2
        ;;
    uninstall)
        uninstall $2
        ;;
    desktop)
        desktop $2
        ;;
    help)
        help
        ;;
    *)
        echo "Error: Unknown command '$command'."
        help
        ;;
esac
