{% from "pki/map.jinja" import pki with context %}
{% set host = pki.host %}

host-certificate:
  file.exists:
    - name: {{ host.crt_dest }}

host-key:
  file.exists:
    - name: {{ host.key_dest }}

