{% from "pki/map.jinja" import pki with context %}
{% set ca = pki.ca %}

ca-certificate:
  file.managed:
    - name: {{ ca.dest }}
    - source: {{ ca.src }}
    - user: root
    - group: root
    - mode: 0644
  cmd.wait:
    - name: {{ ca.install_cmd }}
    - watch:
      - file: ca-certificate
