{% from "desktop/map.jinja" import desktop with context %}

{% if 'browser' in desktop %}
{% set browser = desktop.browser %}
browser:
  pkg.installed:
    - pkgs: {{ browser.pkgs }}
{% endif %}

