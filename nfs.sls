# debian comes pre-installed with nfs-common and rpcbind
# which runs as a service on port 111
#
# as long as we are not using nfs, these should just not be installed at all.

remove-nfs-common:
  pkg.purged:
    - pkgs:
      - nfs-common
      - rpcbind
    # only if it is not installed because of other packages depending on it
    - onlyif: 'test $(apt-cache rdepends --installed -i nfs-common | tail -n +3 | wc -l) -eq 0'

