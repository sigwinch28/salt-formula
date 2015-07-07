{% set video = grains.video %}
{% from "xorg/map.jinja" import xorg with context %}

include:
  - video.{{ video }}

xorg:
  pkg.installed:
    - pkgs: {{ xorg.pkgs }}
    - require:
      - sls: video.{{ video }}

