{% from "utils/map.jinja" import utils with context %}

{% for util, pkgs in utils.iteritems() %}
{{ util }}:
  pkg.installed:
    - pkgs: {{ pkgs }}
{% endfor %}

