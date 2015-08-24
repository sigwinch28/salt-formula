{% from "vpn/map.jinja" import vpn with context %}

vpn:
  pkg.installed:
    - pkgs: {{ vpn.pkgs }}

