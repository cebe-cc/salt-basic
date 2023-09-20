#
# Setting up bashrc and profile files, also motd
#
# https://bencane.com/2013/09/16/understanding-a-little-more-about-etcprofile-and-etcbashrc/
# https://ownyourbits.com/2017/04/05/customize-your-motd-login-message-in-debian-and-ubuntu/
#

/etc/bash.bashrc:
  file.managed:
    - source: salt://basic/etc/bash.bashrc

/etc/profile.d/cowsay_root.sh:
  file.managed:
    - source: salt://basic/etc/profile.d/cowsay_root.sh

/etc/profile.d/ssh_clear_screen.sh:
  file.managed:
    - source: salt://basic/etc/profile.d/ssh_clear_screen.sh


#
# motd
#

figlet:
  pkg.installed

/etc/motd:
  file.absent

/etc/update-motd.d:
  file.directory

/etc/update-motd.d/10-uname:
  file.managed:
    - mode: '0755'
    - contents: |
        #!/bin/sh
        uname -srvmo

    - require:
        - file: /etc/update-motd.d

/etc/update-motd.d/20-info:
  file.managed:
    - mode: '0755'
    - contents: |
        #!/bin/sh

        figlet `cat /etc/hostname | sed 's/\([a-z]*\).*/\1/'`
        echo "{{ grains.id }}  running  {{ grains.lsb_distrib_description if 'lsb_distrib_description' in grains else grains.osfullname  }}"

        upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
        secs=$((${upSeconds}%60))
        mins=$((${upSeconds}/60%60))
        hours=$((${upSeconds}/3600%24))
        days=$((${upSeconds}/86400))
        UPTIME=`printf "%d days, %02dh %02dm %02ds" "$days" "$hours" "$mins" "$secs"`

        # get the load averages
        read one five fifteen rest < /proc/loadavg

        echo "
        $(tput setaf 2)`date +"%A, %e %B %Y, %r"`$(tput setaf 1)

        Uptime.............: ${UPTIME}
        Memory.............: `cat /proc/meminfo | grep MemFree | awk {'print $2'}`kB (Free) / `cat /proc/meminfo | grep MemTotal | awk {'print $2'}`kB (Total)
        Load Averages......: ${one}, ${five}, ${fifteen} (1, 5, 15 min)
        Running Processes..: `ps ax | wc -l | tr -d " "`
        IP Addresses.......: `ip a | grep glo | awk '{print $2}' | head -1 | cut -f1 -d/` and `wget -q -O - http://icanhazip.com/ | tail`

        $(tput sgr0)"

    - require:
        - file: /etc/update-motd.d

