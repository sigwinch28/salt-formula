{% from "pki/map.jinja" import pki with context %}
{% set host = pki.host %}

host-certificate:
  file.exists:
    - name: {{ host.crt }}

host-key:
  file.exists:
    - name: {{ host.key }}

