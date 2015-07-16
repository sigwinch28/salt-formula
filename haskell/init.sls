{% from "haskell/map.jinja" import haskell with context %}

haskell:
  pkg.installed:
    - pkgs: {{ haskell.pkgs }}

