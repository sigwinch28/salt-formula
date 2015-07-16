include:
{% if 'desktop' in salt['grains.get']('role', '') %}
  - erlang
{% else %}
  - erlang.nox
{% endif %}

