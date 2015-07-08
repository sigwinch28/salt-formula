{% from "multimedia/map.jinja" import multimedia with context %}
{% set ffmpeg = multimedia.ffmpeg %}

ffmpeg:
  pkg.installed:
    - pkgs: {{ ffmpeg.pkgs }}

