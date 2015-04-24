{% from "gpg/map.jinja" import gpg with context %}

gpg:
  pkg.installed:
    - pkgs: {{ gpg.pkgs }}

