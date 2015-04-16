{% from "desktop/map.jinja" import desktop with context %}

{% if 'fonts' in desktop %}
{% set fonts = desktop.fonts %}
fonts:
  pkg.installed:
    - pkgs: {{ fonts.pkgs }}
{% endif %}
