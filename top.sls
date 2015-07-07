base:
  '*':
    - zsh
  'os:Arch':
    - match: grain
    - pacman
  'ryuko':
    - gpg
    - gpg.agent
    - ssh.agent
    - ssh.client
    - vcs

