{% from "desktop/map.jinja" import desktop with context %}

{% if 'apps' in desktop %}
{% set apps = desktop.apps %}
{% for category, pkgs in apps.iteritems() %}
{{ category }}:
  pkg.installed:
    - pkgs: {{ pkgs }}
{% endfor %}
{% endif %}

