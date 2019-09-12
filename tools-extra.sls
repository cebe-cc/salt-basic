
#
# text utils
#

# convert line endings
tofrodos:
  pkg.installed
# encoding conversion
recode:
  pkg.installed

#
# terminal
#

screen:
  pkg.installed
tmux:
  pkg.installed

#
# archive tools
#

zip:
  pkg.installed
unzip:
  pkg.installed
zlib1g:
  pkg.installed
zlib1g-dev:
  pkg.installed
lzma:
  pkg.installed

#
# encryption tools
#

gnupg2:
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

ruby:
  pkg.installed

#
# network tools
#

whois:
  pkg.installed
netcat-openbsd:
  pkg.installed
ngrep:
  pkg.installed
tcpdump:
  pkg.installed
nload:
  pkg.installed
telnet:
  pkg.installed
#tcpd:
#  pkg.installed
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


