base:
  '*':
    - zsh
  'os:Arch':
    - match: grain
    - pacman
  'ryuko':
    - gpg
    - gpg.service
    - ssh.client
    - vcs

