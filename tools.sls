#
# text
# 

cowsay:
  pkg.installed
figlet:
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
python3:
  pkg.installed
php:
  pkg.installed:
    - pkgs:
{% if grains['oscodename'] == 'jessie' or grains['oscodename'] == 'wheezy' %}
      - php5-cli
      - php5-sqlite
{% else %}
      - php-cli
      - php-bz2
      - php-mbstring
      - php-sqlite3
      - php-curl
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

host:
  pkg.installed
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

