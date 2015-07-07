#
# Variables for dynamic forumla selection
#
{% set video = salt['grains.get']('video', '') %}

base:
#------------------------------------------------------------------------------
# All Hosts
#------------------------------------------------------------------------------

  '*':
    - gpg
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
# Video Drivers
#

{% if video %}
  'video:{{ video }}':
    - match: grain
    - video.{{ video }}
{% endif %}

