#
# Variables for dynamic forumla selection
#
{% set languages = salt['grains.get']('language', '') %}
{% set audio = salt['grains.get']('audio', '') %}
{% set video = salt['grains.get']('video', '') %}
{% set prometheus_exporters = salt['grains.get']('prometheus_exporter', '') %}

base:
#------------------------------------------------------------------------------
# All Hosts
#------------------------------------------------------------------------------

  '*':
    - gpg
    - ntp.client
    - ssh.client
    - xdg
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
# Individual Minions
#------------------------------------------------------------------------------
  'honnouji':
    - nfs.server
    - proxy.server
    - vpn.client
  'area11':
    - prometheus.server
    - proxy.server
    - vpn.server

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
    - gtk
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
# Programming Languages
#

{% if languages %}
{% for lang in languages %}
  'language:{{ lang }}':
    - match: grain
    - lang.{{ lang }}
{% endfor %}
{% endif %}

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

#
# Prometheus Exporters
#

{% if prometheus_exporters %}
{% for exporter in prometheus_exporters %}
  'prometheus_exporter:{{ exporter }}':
    - match: grain
    - prometheus.exporter.{{ exporter }}
{% endfor %}
{% endif %}
