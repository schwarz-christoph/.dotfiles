# Symlinks
[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/dunst/dunstrc"
path = "{{ home_dir }}/.config/dunst/dunstrc"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/fontconfig/fonts.conf"
path = "{{ home_dir }}/.config/fontconfig/fonts.conf"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/i3status-rust/config.toml"
path = "{{ home_dir }}/.config/i3status-rust/config.toml"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/i3status-rust/config.toml"
path = "{{ home_dir }}/.config/i3status-rust/config.toml"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/ranger/rc.conf"
path = "{{ home_dir }}/.config/ranger/rc.conf"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/ranger/commands.py"
path = "{{ home_dir }}/.config/ranger/commands.py"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/ranger/plugins/"
path = "{{ home_dir }}/.config/ranger/plugins"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/rofi"
path = "{{ home_dir }}/.config/rofi"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/sway/config"
path = "{{ home_dir }}/.config/sway/config"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/swaylock/config"
path = "{{ home_dir }}/.config/swaylock/config"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/systemd/user/dunst.service"
path = "{{ home_dir }}/.config/systemd/user/dunst.service"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/systemd/user/kanshi.service"
path = "{{ home_dir }}/.config/systemd/user/kanshi.service"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/systemd/user/swayidle.service"
path = "{{ home_dir }}/.config/systemd/user/swayidle.service"

[[jobs]]
type = "file"
state= "link"
force = true
src = "/dev/null"
path = "{{ home_dir }}/.config/systemd/user/pipewire-session-manager.service"

[[jobs]]
type = "file"
state= "link"
force = true
src = "/dev/null"
path = "{{ home_dir }}/.config/systemd/user/pulseaudio.service.service"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/systemd/user/sway-session.target"
path = "{{ home_dir }}/.config/systemd/user/sway-session.target"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/systemd/user/sway-session.target.wants/"
path = "{{ home_dir }}/.config/systemd/user/sway-session.target.wants"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/tmuxinator/lldb.yml"
path = "{{ home_dir }}/.config/tmuxinator/lldb.yml"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/xdg-desktop-portal-wlr/config"
path = "{{ home_dir }}/.config/xdg-desktop-portal-wlr/config"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.config/waybar"
path = "{{ home_dir }}/.config/waybar"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.bashrc"
path = "{{ home_dir }}/.bashrc"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.gitconfig"
path = "{{ home_dir }}/.gitconfig"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.gitignore_global"
path = "{{ home_dir }}/.gitignore_global"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.p10k.zsh"
path = "{{ home_dir }}/.p10k.zsh"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.profile"
path = "{{ home_dir }}/.profile"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.tmux.conf"
path = "{{ home_dir }}/.tmux.conf"

[[jobs]]
type = "file"
state= "link"
force = true
src = "{{ home_dir }}/.dotfiles/.zshrc"
path = "{{ home_dir }}/.zshrc"

# Programms
sudo dnf install tmux
sudo dnf install zsh
sudo dnf install sway
sudo dnf isntall swaylock
sudo dnf install swayidle
sudo dnf install waybar
sudo dnf install polkit-gnome
sudo dnf install grimshot
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-34.noarch.rpm
sudo dnf install v4l2loopback kmod-v4l2loopback
sudo dnf install ranger

cd Downloads
git clone https://github.com/dunst-project/dunst.git
cd dunst
make
sudo make install
rm dunst

name = "rofi-wayland: repository"
type = "git"
clone = true
dest = "{{ home_dir }}/workspace/other/rofi"
repo = "https://github.com/lbonn/rofi.git"

[[jobs]]
name = "rofi-wayland: install"
needs = ["rofi-wayland: repository"]
type = "command"
chdir = "{{ home_dir }}/workspace/other/rofi"
command = "bash"
argv = [
  "-c",
  'meson setup build --prefix ${HOME}/.local && cd build && ninja install'
]
when = "{{ not has_executable(exe='rofi') }}"

# Config
# How to configure the display script

1. Create File under /etc/udev/rules.d/
- `touch /etc/udev/rules.d/90-sway-monitor.rules`
```
SUBSYSTEM=="drm", ACTION=="change", RUN+="/usr/local/bin/find-active-user-display-manager.sh"
SUBSYSTEM=="drm", ACTION=="add", RUN+="/usr/local/bin/find-active-user-display-manager.sh"
SUBSYSTEM=="drm", ACTION=="remove", RUN+="/usr/local/bin/find-active-user-display-manager.sh"
```
2. Create a File under /usr/local/bin
- `touch /usr/local/bin/find-active-user-display-manager.sh`
```
#!/bin/bash

# Finde den angemeldeten Benutzer (angenommen, es gibt nur einen)
user=$(who | awk '{print $1}' | sort -u | head -n 1)

# Prüfe, ob ein Benutzer gefunden wurde
if [ -z "$user" ]; then
    echo "Kein Benutzer angemeldet."
    exit 1
fi

# Führe den Befehl als dieser Benutzer aus
sudo -u $user DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $user)/bus systemctl --user start display-manager.service
```
3. Create Systemd Task
- Create File under ~/.config/systemd/user/display-manager.service
- `touch ~/.config/systemd/user/display-manager.service`
```
[Unit]
Description=Display Manager Script

[Service]
Type=simple
ExecStart=/home/christoph-sw/.dotfiles/.config/sway/display_config.sh

[Install]
WantedBy=default.target
```
- Enable the Service
- `systemctl --user daemon-reload`
- `systemctl --user enable display-manager.service`
- `systemctl --user start display-manager.service`
5. Reload udev
- udevadm control --reload-rules

