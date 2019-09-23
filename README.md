# salt-basic

Basic saltstack states to make a minimal server configuration.

## Usage

Add these to your saltstack states:

    git submodule add https://github.com/cebe-cc/salt-basic.git salt/basic
    
The states are independent of their actual location in the state file tree, so you may replace `salt/basic` with a location of your choice.

## Supported OSs

- Debian
  - 7, `wheezy`
  - 8, `jessie`
  - 9, `stretch`
  - 10, `buster`

## Features

- Add LTS package repos and Debian backports, also install `https` transport for apt (`apt.sls`)
- Enable automatic security upgrades (`apt-upgrades.sls`)
- :construction: configure a nice bashrc (`bash.sls`)
- disable NFS if not required, fixes [issue with pre-installed portmapper deamon](https://www.bsi.bund.de/EN/Topics/IT-Crisis-Management/CERT-Bund/CERT-Reports/HOWTOs/Open-Portmapper-Services/open-Portmapper-services_node.html) (`nfs.sls`)
- :construction: ensure time synchronisation is configured properly, either via NTP or [systemd-timesyncd](https://wiki.archlinux.org/index.php/Systemd-timesyncd) (`ntp.sls`)
- create an SSH key for root (`ssh.sls`)
- manage SSH authorized keys for user `root`. If present in pillar, keys will be added to `/root/.ssh/authorized_keys`:

  ```yaml
  # configure ssh authorized_keys in pillar
  ssh:
    authorized_keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAA...IawH9LTTF2C8D4Vl you@example.com
  ```

- install common cli tools (`tools.sls`, optional: `tools-extra.sls`, `tools-build.sls`)
- :construction: Make sure a full VI editor is installed and configured (`vim.sls`)
- :construction: GIT and GIT config

