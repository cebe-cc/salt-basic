# make cowsay available to root also
# cowsay is installed in /usr/games, which is only in PATH for normal users, root should also be allowed to have fun :)

if [ "`id -u`" -eq 0 ]; then
  PATH="$PATH:/usr/games"
fi
export PATH
