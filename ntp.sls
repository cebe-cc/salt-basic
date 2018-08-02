
{% if grains['init'] == 'systemd' %}
# do nothing, just use systemd-timesyncd
{% else %}
ntp:
  pkg.installed
{% endif %}

