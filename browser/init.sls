{% from "browser/map.jinja" import browser with context %}
{% set chosen_browser = salt['grains.get']('browser', browser.default) %}
include:
  - .{{ chosen_browser }}
