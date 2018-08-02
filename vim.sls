vim:
  pkg.installed

# TODO add vimrc file

vim-editor:
  cmd.run:
    - name: 'update-alternatives --set editor /usr/bin/vim.basic'
    - unless: 'update-alternatives --query editor | grep "Value: /usr/bin/vim.basic"'
#    - require:
#      - file: /etc/vim/vimrc

