{% from "wm/map.jinja" import wm with context %}
{% set bspwm = wm.bspwm %}

include:
  - xorg

bspwm:
  pkg.installed:
    - pkgs: {{ bspwm.pkgs }}
    - require:
      - sls: xorg

