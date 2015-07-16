{% from "erlang/map.jinja" import erlang with context %}
{% set erlang = erlang.nox %}

include:
  - .rebar

erlang:
  pkg.installed:
    - pkgs: {{ erlang.pkgs }}

