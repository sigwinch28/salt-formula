{% from "multimedia/map.jinja" import multimedia with context %}
{% set mpv = multimedia.mpv %}

mpv:
  pkg.installed:
    - pkgs: {{ mpv.pkgs }}

