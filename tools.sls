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

{% if grains['oscodename'] == 'squeeze' %}
gnupg:
  pkg.installed
{% else %}
gnupg:
  pkg.installed
{% endif %}
gpgv:
  pkg.installed
openssl:
  pkg.installed
{% if grains.osmajorrelease < 9 %}
openssl-blacklist:
  pkg.installed
{% endif %}

#
# languages
#

perl:
  pkg.installed
#ruby:
#  pkg.installed
python:
  pkg.installed
{% if grains['oscodename'] == 'jessie' or grains['oscodename'] == 'wheezy' %}
php5-cli:
  pkg.installed
php5-sqlite:
  pkg.installed
{% else %}
php-cli:
  pkg.installed
php-bz2:
  pkg.installed
php-curl:
  pkg.installed
php-sqlite3:
  pkg.installed
{% endif %}


#
# web tools
#

curl:
  pkg.installed
wget:
  pkg.installed
#wput:
#  pkg.installed
#ftp:
#  pkg.installed


#
# network tools
#

whois:
  pkg.installed
host:
  pkg.installed
dnsutils:
  pkg.installed
lsof:
  pkg.installed
#net-tools:
#  pkg.installed
netcat-openbsd:
  pkg.installed
ngrep:
  pkg.installed
tcpdump:
  pkg.installed
nload:
  pkg.installed
traceroute:
  pkg.installed
telnet:
  pkg.installed
#tcpd:
#  pkg.installed
iproute2:
  pkg.installed
nmap:
  pkg.installed
ipcalc:
  pkg.installed


#
# versioning
#

git:
  pkg.installed
patch:
  pkg.installed
rsync:
  pkg.installed

#
# build tools
#

#autoconf:
#  pkg.installed
#automake:
#  pkg.installed
#binutils:
#  pkg.installed
#build-essential:
#  pkg.installed
#dh-make-php:
#  pkg.installed
#fakeroot
#  pkg.installed
#gcc:
#  pkg.installed
#g++:
#  pkg.installed
#make:
#  pkg.installed

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

