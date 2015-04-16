{% from "audio/map.jinja" import audio with context %}

{% set alsa = audio.alsa %}

{% if 'utils' in alsa %}
alsa_utils:
  pkg.installed:
    - pkgs: {{ alsa.utils }}
{% endif %}

{% if 'plugins' in alsa %}
alsa_plugins:
  pkg.installed:
    - pkgs: {{ alsa.plugins }}
{% endif %}

