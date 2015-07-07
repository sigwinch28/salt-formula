{% from "wm/map.jinja" import wm with context %}
{% set wms = salt['grains.get']('wm', wm.default) %}

include:
{% for wm in wms %}
  - .{{ wm }}
{% endfor %}

