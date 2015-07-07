{% from "fonts/map.jinja" import fonts with context %}

{% for name, pkgs in fonts.iteritems() %}
font-{{ name }}:
  pkg.installed:
    - pkgs: {{ pkgs }}
{% endfor %}

