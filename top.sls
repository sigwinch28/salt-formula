#
# Variables for dynamic forumla selection
#
{% set audio = salt['grains.get']('audio', '') %}
{% set video = salt['grains.get']('video', '') %}

base:
#------------------------------------------------------------------------------
# All Hosts
#------------------------------------------------------------------------------

  '*':
    - gpg
    - ntp.client
    - ssh.client
    - zsh

#------------------------------------------------------------------------------
# Operating Systems
#------------------------------------------------------------------------------

#
# Arch Linux
#

  'os:Arch':
    - match: grain
    - pacman

#------------------------------------------------------------------------------
# Custom Grains
#------------------------------------------------------------------------------

#
# Roles
#

  'role:desktop':
    - match: grain
    - browser
    - fonts
    - gpg
    - gpg.agent
    - irc
    - multimedia
    - ssh.agent
    - ssh.client
    - utils
    - vcs
    - wm
    - xorg
  'role:server':
    - match: grain
    - ssh.server

#
# Audio Drivers
#

{% if audio %}
  'audio:{{ audio }}':
    - match: grain
    - audio.{{ audio }}
{% endif %}

#
# Video Drivers
#

{% if video %}
  'video:{{ video }}':
    - match: grain
    - video.{{ video }}
{% endif %}

