# clear terminal screen if user logs in via ssh
#

if [ "$PS1" ] && [ "$SSH_TTY" ]; then
    tput clear

    run-parts --lsbsysinit /etc/update-motd.d
fi
