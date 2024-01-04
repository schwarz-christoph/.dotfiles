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

