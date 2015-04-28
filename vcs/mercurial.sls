{% from "vcs/map.jinja" import vcs with context %}
{% set mercurial = vcs.mercurial %}

mercurial:
  pkg.installed:
    - pkgs: {{ mercurial.pkgs }}

