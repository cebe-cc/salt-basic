#
# apply debian lts apt sources and/or backports
#

{% if grains['os'] == 'Debian' %}
  
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

{% if grains['oscodename'] == 'buster' %}
{% if grains['pythonversion'][0] == 3 %}
python3-apt:
  pkg.installed
{% else %}
python-apt:
  pkg.installed
{% endif %}

backports:
  pkgrepo.managed:
    - humanname: Debian Buster Backports
    - name: deb  http://httpredir.debian.org/debian buster-backports main
    - file: /etc/apt/sources.list.d/backports.list
    - require:
        {% if grains['pythonversion'][0] == 3 %}
        - pkg: python3-apt
        {% else %}
        - pkg: python-apt
        {% endif %}
{% endif %}
{% endif %}

apt-transport-https:
  pkg.installed
