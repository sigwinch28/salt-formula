base:
  '*':
    - gpg
    - vcs
    - utils
    - zsh
  'os:Arch':
    - match: grain
    - pacman
  'ryuko':
    - audio.pulseaudio
    - desktop
    - go
    - gpg.service
    - ssh.client
    - ssh.server
    - video.nvidia
    - virtualbox.host

