{% from "erlang/map.jinja" import erlang with context %}
{% set rebar = erlang.rebar %}

rebar:
  pkg.installed:
    - pkgs: {{ rebar.pkgs }}
    - require:
      - pkg: erlang

