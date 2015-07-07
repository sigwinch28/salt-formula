{% from "desktop/browser/map.jinja" import browser with context %}
{% set firefox = browser.firefox %}

firefox:
  pkg.installed:
    - pkgs: {{ firefox.pkgs }}

