{% from "desktop/map.jinja" import desktop with context %}

{% if 'xorg' in desktop %}
{% set xorg = desktop.xorg %}
xorg:
  pkg.installed:
    - pkgs: {{ xorg.pkgs }}
    - require:
      - pkg: video_driver
{% endif %}
