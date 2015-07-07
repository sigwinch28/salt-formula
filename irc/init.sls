{% from "irc/map.jinja" import irc with context %}
{% set weechat = irc.weechat %}

weechat:
  pkg.installed:
    - pkgs: {{ weechat.pkgs }}

