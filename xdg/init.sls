{% from "xdg/map.jinja" import xdg with context %}

xdg-user-dirs:
  pkg.installed:
    - pkgs: {{ xdg.pkgs }}

