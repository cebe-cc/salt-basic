
{% if grains['init'] == 'systemd' %}
# do nothing, just use systemd-timesyncd
# TODO check if enabled, and enable if it is not https://wiki.archlinux.org/index.php/Systemd-timesyncd
# TODO make sure it is not enabled in VMs that can not update the system clock
{% else %}
ntp:
  pkg.installed
{% endif %}

