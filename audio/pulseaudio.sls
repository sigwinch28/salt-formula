{% from "audio/map.jinja" import audio with context %}
{% set pulseaudio = audio.pulseaudio %}

include:
  - .alsa

pulseaudio:
  pkg.installed:
    - pkgs: {{ pulseaudio.pkgs }}
    - require:
      - sls: audio.alsa

pulseaudio_utils:
  pkg.installed:
    - pkgs: {{ pulseaudio.utils }}
    - require:
      - pkg: pulseaudio
