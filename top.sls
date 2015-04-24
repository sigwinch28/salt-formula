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
    - gpg.service
    - ssh.client
    - ssh.server
    - video.nvidia
    - virtualbox.host

