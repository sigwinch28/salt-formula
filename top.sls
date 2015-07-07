base:
  '*':
    - zsh
  'os:Arch':
    - match: grain
    - pacman
  'ryuko':
    - desktop.browser
    - desktop.fonts
    - gpg
    - gpg.agent
    - ssh.agent
    - ssh.client
    - vcs
    - video.nvidia

