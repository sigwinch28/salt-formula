{% from "multimedia/map.jinja" import multimedia with context %}
{% set feh = multimedia.feh %}
{% set imagemagick = multimedia.imagemagick %}

feh:
  pkg.installed:
    - pkgs: {{ feh.pkgs }}

imagemagick:
  pkg.installed:
    - pkgs: {{ feh.pkgs }}
