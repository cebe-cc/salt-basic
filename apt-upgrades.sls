# enable unattended installation of security updates

unattended-upgrades:
  pkg.installed

/etc/apt/apt.conf.d/20auto-upgrades:
  file.managed:
    - content: |
      APT::Periodic::Update-Package-Lists "1";
      APT::Periodic::Unattended-Upgrade "1";
    - require:
      - pkg: unattended-upgrades


