base:
  '*':
    - gpg
    - vcs
    - utils
  'os:Arch':
    - match: grain
    - pacman
  'ryuko':
    - desktop
    - gpg.service
    - audio.pulseaudio
    - video.nvidia
    - virtualbox.host

