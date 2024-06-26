# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

PATH="$HOME/.dotfiles/.local/bin:$PATH"
PATH="$HOME/.scripts:$PATH"
PATH="$HOME/.yarn/bin:$PATH"
PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
PATH="$HOME/.gem/ruby/current/bin:$PATH"
PATH="$HOME/.luarocks/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"

# Rust 
PATH="$HOME/.cargo/bin:$PATH"

# set up go as needed. GOPRIVATE is set up together with .gitconfig
PATH=$PATH:~/go/bin
export GOPATH=~/go
export GOPRIVATE=github.com

export ANDROID_HOME=~/.android-sdks

# Set up node environment
PATH="$HOME/.npmpath/bin:$PATH"
export NODE_PATH="$HOME/.npmpath/lib/node_modules"
# Fix for   reason: 'unsupported',code: 'ERR_OSSL_EVP_UNSUPPORTED'
#export NODE_OPTIONS=--openssl-legacy-provider

if [ -f "$HOME/.asdf/plugins/java/set-java-home.bash" ]; then
  . "$HOME/.asdf/plugins/java/set-java-home.bash"
else
  export JAVA_HOME="$(dirname $(dirname $(readlink -f /usr/bin/javac)))"
fi

if [ -d "/usr/lib/ccache" ]; then
  PATH="/usr/lib/ccache:$PATH"
fi

if command -v guix 1>/dev/null 2>&1; then
  GUIX_PROFILE="$HOME/.guix-profile"
  if [ -d "$GUIX_PROFILE" ]; then
    SSL_CERT_DIR_="$GUIX_PROFILE/etc/ssl/certs"
    if [ -d "$SSL_CERT_DIR_" ]; then
      export SSL_CERT_DIR="$SSL_CERT_DIR_"
      export SSL_CERT_FILE="$HOME/.guix-profile/etc/ssl/certs/ca-certificates.crt"
      export GIT_SSL_CAINFO="$SSL_CERT_FILE"
      export CURL_CA_BUNDLE="$SSL_CERT_FILE"
    fi

    export GUIX_LOCPATH=$GUIX_PROFILE/lib/locale
    if [ -f "$GUIX_PROFILE"/etc/profile ]; then
      . "$GUIX_PROFILE/etc/profile"
    fi
  fi

  GUIX_EXTRA_PROFILES=$HOME/.guix-extra-profiles
  if [ -d "$GUIX_EXTRA_PROFILES" ]; then
    for i in "$GUIX_EXTRA_PROFILES"/*; do
      profile=$i/$(basename "$i")
      if [ -f "$profile"/etc/profile ]; then
        GUIX_PROFILE="$profile"
        . "$GUIX_PROFILE"/etc/profile

        if [ -d "$GUIX_PROFILE/share" ]; then
          export XDG_DATA_DIRS="$GUIX_PROFILE/share/:$XDG_DATA_DIRS"
          export XDG_CONFIG_DIRS="$GUIX_PROFILE/etc/:$XDG_CONFIG_DIRS"
        fi
      fi
      unset profile
    done
  fi
fi

if [ -f "$HOME/.dotfiles/asdf/asdf.sh" ]; then
  . "$HOME/.dotfiles/asdf/asdf.sh"
fi

if [ -d "$HOME/.dotfiles/pyenv/bin" ]; then
  export PYENV_ROOT="$HOME/.dotfiles/pyenv"
  export PYTHON_CONFIGURE_OPTS="--enable-shared"
  PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"

  pyenv_virtualenv_plugin_root="$HOME/.dotfiles/pyenv-plugins/pyenv-virtualenv"
  if [ -d "$pyenv_virtualenv_plugin_root" ]; then
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    PATH="$pyenv_virtualenv_plugin_root/bin:$PATH"
    eval "$(pyenv virtualenv-init -)"
    eval "$(pyenv init --path)"
  fi
fi

export EDITOR=nvim

export QT_QPA_PLATFORMTHEME=qt5ct

if command -v rg 1>/dev/null 2>&1; then
  export RIPGREP_CONFIG_PATH="$HOME/.dotfiles/.ripgreprc"
  export FZF_DEFAULT_COMMAND='fd --type f --hidden .'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fd --type d --hidden .'
fi

# Theming, look and feel of newt apps, e.g. nmtui, whiptail scripts
export NEWT_COLORS='
    root=white,black
    border=black,lightgray
    window=lightgray,lightgray
    shadow=black,gray
    title=black,lightgray
    button=black,cyan
    actbutton=white,cyan
    compactbutton=black,lightgray
    checkbox=black,lightgray
    actcheckbox=lightgray,cyan
    entry=black,lightgray
    disentry=gray,lightgray
    label=black,lightgray
    listbox=black,lightgray
    actlistbox=black,cyan
    sellistbox=lightgray,black
    actsellistbox=lightgray,black
    textbox=black,lightgray
    acttextbox=black,cyan
    emptyscale=,gray
    fullscale=,cyan
    helpline=white,black
    roottext=lightgrey,black
'

# make (linux) menuconfig less bright
export MENUCONFIG_COLOR=blackbg

# tbsm is installed, simply assuming tbsm as dm for now
if command -v tbsm 1>/dev/null 2>&1; then
  if [[ ! ${DISPLAY} && ${XDG_VTNR} == 1 ]]; then
    exec tbsm
  fi
fi

if command -v keychain 1>/dev/null 2>&1; then
  eval "$(keychain -q --eval id_rsa)"
fi

if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

if [ -f "$HOME/.profile.local" ]; then
  . "$HOME/.profile.local"
fi

# sway is installed, simply assuming sway as session for now
#if command -v sway 1>/dev/null 2>&1; then
  # setting gdk_backend and qt_qpa_platform manually may cause trouble
  # export QT_QPA_PLATFORM=wayland
#  export GDK_BACKEND=wayland
#  export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
#  export CLUTTER_BACKEND=wayland
#  export XDG_SESSION_TYPE=wayland
#  export XDG_SESSION_DESKTOP=sway
#  export XDG_CURRENT_DESKTOP=sway
#  export DESKTOP_SESSION=sway
#
#  export LIBSEAT_BACKEND=logind
#
#  export SDL_VIDEODRIVER=wayland
#  export MOZ_ENABLE_WAYLAND=1
#  export MOZ_WEBRENDER=1
#
#  export GTK_THEME=Solarized-Dark-Cyan-GTK
#
#  # Assume gnome-keyring is set up
#  export SSH_AUTH_SOCK="/run/user/$(id -u)/keyring/ssh"
#
#  # Fix Java AWT applications on wayland
#  export _JAVA_AWT_WM_NONREPARENTING=1
#
#  # Android studio breaks on sway if the shipped jdk is used for the UI
#  export STUDIO_JDK=/usr/lib/jvm/java-11-openjdk-amd64/
#fi
#  # Autostart sway on tty1
#  if [ "$(tty)" = "/dev/tty1" ]; then
#    if lshw -C display 2>/dev/null | grep -qi "vendor.*nvidia"; then
#      exec sway --unsupported-gpu
#    else
#      exec sway
#    fi
#  fi
#else
#  # Autostart x session (i3) on tty1
#  [ "$(tty)" = "/dev/tty1" ] && exec startx
#fi
