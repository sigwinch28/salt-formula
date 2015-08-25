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
  'area11':
    - prometheus.server

#------------------------------------------------------------------------------
# Pillar Matches
#------------------------------------------------------------------------------

#
# NFS
#

  'nfs:lookup:export:*':
    - match: pillar_pcre
    - nfs.server

#
# Proxy
#

  'proxy:lookup:conf:*':
    - match: pillar_pcre
    - proxy.server

#
# Samba
#
  'samba:lookup:share:*':
    - match: pillar_pcre
    - samba.server

#
# VPN
#

  'vpn:lookup:clients:*':
    - match: pillar_pcre
    - vpn.client

  'vpn:lookup:servers:*':
    - match: pillar_pcre
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
