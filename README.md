# salt-base
Basic saltstack states to make a minimal server configuration.

## Supported OSs

- Debian
  - 6, `squeeze`
  - 7, `wheezy`
  - 8, `jessie`
  - 9, `stretch`

## Features

- Add LTS package repos and Debian backports (`apt.sls`)
- Enable automatic security upgrades (`apt-upgrades.sls`)
- :construction: configure a nice bashrc (`bash.sls`)
- disable NFS if not required, fixes [issue with pre-installed portmapper deamon](https://www.bsi.bund.de/EN/Topics/IT-Crisis-Management/CERT-Bund/CERT-Reports/HOWTOs/Open-Portmapper-Services/open-Portmapper-services_node.html) (`nfs.sls`)
- :construction: ensure time synchronisation is configured properly, either via NTP or [systemd-timesyncd](https://wiki.archlinux.org/index.php/Systemd-timesyncd) (`ntp.sls`)
- create an SSH key for root (`ssh.sls`)
- install common cli tools (`tools.sls`, optional: `tools-extra.sls`, `tools-build.sls`)
- :construction: Make sure a full VI editor is installed and configured (`vim.sls`)
- :construction: GIT and GIT config

