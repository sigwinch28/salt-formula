{% from "gtk/map.jinja" import gtk with context %}
{% set utils = gtk.utils %}

lxappearance:
  pkg.installed:
    - pkgs: {{ utils.lxappearance.pkgs }}

