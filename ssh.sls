# generate SSH key for root user
'ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa':
  cmd.run:
    - unless: test -f /root/.ssh/id_rsa

# manage authorized_keys if present in pillar
{% if salt['pillar.get']('ssh:authorized_keys', [])|length > 0 %}
sshkeys:
  ssh_auth:
    - present
    - user: root
    - enc: ssh-rsa
    - names:
      {% for sshkey in salt['pillar.get']('ssh:authorized_keys') %}
        - {{ sshkey }}
      {% endfor %}

{%endif%}

sshpass:
  pkg.installed