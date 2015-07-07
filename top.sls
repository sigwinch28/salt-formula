#
# Variables for dynamic forumla selection
#
{% set video = salt['grains.get']('video', '') %}
{% set roles = salt['grains.get']('role', '') %}

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

{% if roles %}
{% for role in roles %}
  'role:{{ role }}':
    - match: grain
    - roles.{{ role }}
{% endfor %}
{% endif %}

#
# Video Drivers
#

{% if video %}
  'video:{{ video }}':
    - match: grain
    - video.{{ video }}
{% endif %}

