{% from "vcs/map.jinja" import vcs with context %}
{% set git = vcs.git %}

git:
  pkg.installed:
    - pkgs: {{ git.pkgs }}

