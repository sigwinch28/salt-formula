{% from "desktop/map.jinja" import desktop with context %}

include:
  - .xorg

{% if 'wm' in desktop %}
{% set wm = desktop.wm %}
window_manager:
  pkg.installed:
    - pkgs: {{ wm.pkgs }}
    - require:
      - pkg: xorg
{% endif %}
