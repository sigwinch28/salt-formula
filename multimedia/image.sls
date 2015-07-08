{% from "multimedia/map.jinja" import multimedia with context %}
{% set feh = multimedia.feh %}

feh:
  pkg.installed:
    - pkgs: {{ feh.pkgs }}

