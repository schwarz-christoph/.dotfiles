# How to configure the display script

1. Create File under /etc/udev/rules.d/
- touch /etc/udev/rules.d/90-sway-monitor.rules
2. Define the Rule
- SUBSYSTEM=="drm", ACTION=="change", RUN+="path_to_script" (eg SUBSYSTEM=="drm", ACTION=="change", RUN+="/home/christoph-sw/.dotfiles/.config/sway/display_config.sh")
3. reload udev
- udevadm control --reload-rules

