#
# text
# 

cowsay:
  pkg.installed

#
# monitoring / system status
#

htop:
  pkg.installed
sysstat:
  pkg.installed

#
# user management
#

pwgen:
  pkg.installed

#
# files
#

findutils:
  pkg.installed
locate:
  pkg.installed

#
# text utils
#

grep:
  pkg.installed
sed:
  pkg.installed
gawk:
  pkg.installed
diffutils:
  pkg.installed
less:
  pkg.installed
# stream progress reporter
pv:
  pkg.installed

#
# archive tools
#

tar:
  pkg.installed
gzip:
  pkg.installed
bzip2:
  pkg.installed

#
# encryption tools
#

gpgv:
  pkg.installed

#
# languages
#

perl:
  pkg.installed
{% if grains['oscodename'] == 'bullseye' %}
python3:
  pkg.installed
{% else %}
python:
  pkg.installed
{% endif %}
php:
  pkg.installed:
    - pkgs:
{% if grains['oscodename'] == 'jessie' or grains['oscodename'] == 'wheezy' %}
      - php5-cli
      - php5-sqlite
{% else %}
{% if pillar.php is defined and pillar.php.version is defined %}
      - php{{ pillar.php.version }}-cli
      - php{{ pillar.php.version }}-bz2
      - php{{ pillar.php.version }}-mbstring
      - php{{ pillar.php.version }}-sqlite3
      - php{{ pillar.php.version }}-curl
{% else %}
      - php-cli
      - php-bz2
      - php-mbstring
      - php-sqlite3
      - php-curl
{% endif %}
{% endif %}

#
# web tools
#

curl:
  pkg.installed
wget:
  pkg.installed

#
# network tools
#

{% if grains['oscodename'] != 'buster' %}
host:
  pkg.installed
{% endif %}
lsof:
  pkg.installed
traceroute:
  pkg.installed
iproute2:
  pkg.installed
dnsutils:
  pkg.installed

#
# versioning
#

rsync:
  pkg.installed


# install to verify certificates
ca-certificates:
  pkg.installed

# apt-get remove consolekit, this is not really needed on a server in case it is installed by default
consolekit:
  pkg.purged

# remove exim4 mailserver in case it has been installed by default
exim4:
  pkg.purged
exim4-base:
  pkg.purged
exim4-config:
  pkg.purged
exim4-daemon-light:
  pkg.purged

