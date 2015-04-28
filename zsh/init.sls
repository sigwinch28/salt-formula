{% from "zsh/map.jinja" import zsh %}
zsh:
  pkg.installed:
    - pkgs: {{ zsh.pkgs }}

