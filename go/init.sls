{% from "go/map.jinja" import go %}
go:
  pkg.installed:
    - pkgs: {{ go.pkgs }}

