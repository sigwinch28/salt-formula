{% from "browser/map.jinja" import browser with context %}
{% set browsers = salt['grains.get']('browser', browser.default) %}

include:
{% for browser in browsers %}
  - .{{ browser }}
{% endfor %}
