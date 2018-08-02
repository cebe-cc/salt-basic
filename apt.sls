#
# apply debian lts apt sources and/or backports
#

{% if grains['os'] == 'Debian' %}
  
{% if grains['oscodename'] == 'squeeze' %}
/etc/apt/sources.list.d/debian-lts.list:
  file.managed:
    - contents: "deb http://http.debian.net/debian/ squeeze-lts main"
    - user: root
    - group: root
    - mode: 0644
{% endif %}
{% if grains['oscodename'] == 'wheezy' %}
backports:
    pkgrepo.managed:
          - humanname: Debian Wheezy Backports
          - name: deb http://http.debian.net/debian wheezy-backports main
          - file: /etc/apt/sources.list.d/wheezy-backports.list
{% endif %}
{% if grains['oscodename'] == 'jessie' %}
backports:
    pkgrepo.managed:
          - humanname: Debian Jessie Backports
          - name: deb  http://httpredir.debian.org/debian jessie-backports main
          - file: /etc/apt/sources.list.d/backports.list
{% endif %}
{% if grains['oscodename'] == 'stretch' %}
backports:
    pkgrepo.managed:
          - humanname: Debian Stretch Backports
          - name: deb  http://httpredir.debian.org/debian stretch-backports main
          - file: /etc/apt/sources.list.d/backports.list
{% endif %}

{% endif %}
