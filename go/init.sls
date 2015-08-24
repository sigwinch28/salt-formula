{% from "go/map.jinja" import go %}

include:
  - vcs

go:
  pkg.installed:
    - pkgs: {{ go.pkgs }}

