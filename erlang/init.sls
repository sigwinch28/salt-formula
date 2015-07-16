{% from "erlang/map.jinja" import erlang with context %}
{% set erlang = erlang.full %}

include:
  - .rebar

erlang:
  pkg.installed:
    - pkgs: {{ erlang.pkgs }}

