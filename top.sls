#
# Variables for dynamic forumla selection
#
{% set video = salt['grains.get']('video', '') %}
{% set desktop = salt['grains.get']('desktop', 'false') %}

base:
#------------------------------------------------------------------------------
# All Hosts
#------------------------------------------------------------------------------

  '*':
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
# Video Drivers
#

{% if video %}
  'video:{{ video }}':
    - match: grain
    - video.{{ video }}
{% endif %}

#
# Desktop applications
#

{% if desktop %}
  'desktop:true':
    - match: grain
    - browser
    - fonts
    - gpg
    - gpg.agent
    - ssh.agent
    - ssh.client
    - vcs
{% endif %}

