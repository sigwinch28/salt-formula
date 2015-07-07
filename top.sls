base:
  '*':
    - zsh
  'os:Arch':
    - match: grain
    - pacman
  'ryuko':
    - browser
    - fonts
    - gpg
    - gpg.agent
    - ssh.agent
    - ssh.client
    - vcs
    - video.nvidia

