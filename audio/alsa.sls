{% from "audio/map.jinja" import audio with context %}

{% set alsa = audio.alsa %}

{% if 'utils' in alsa %}
alsa-utils:
  pkg.installed:
    - pkgs: {{ alsa.utils }}
{% endif %}

{% if 'plugins' in alsa %}
alsa-plugins:
  pkg.installed:
    - pkgs: {{ alsa.plugins }}
{% endif %}

