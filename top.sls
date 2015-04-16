base:
  '*':
    - vcs
    - utils
  'os:Arch':
    - match: grain
    - pacman
  'ryuko':
    - desktop
    - audio.alsa
    - video.nvidia
