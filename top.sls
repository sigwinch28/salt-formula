base:
  '*':
    - zsh
  'os:Arch':
    - match: grain
    - pacman
  'ryuko':
    - gpg
    - gpg.agent
    - ssh.client
    - vcs

