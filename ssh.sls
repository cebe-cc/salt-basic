# generate SSH key for root user
'ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa':
  cmd.run:
    - unless: test -f /root/.ssh/id_rsa

