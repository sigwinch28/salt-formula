base:
  '*':
    - vcs
    - utils
  'os:Arch':
    - match: grain
    - pacman
  'ryuko':
    - desktop
    - video.nvidia
