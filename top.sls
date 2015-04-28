base:
  '*':
    - gpg
    - vcs
    - utils
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

