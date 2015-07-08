{% from "ntp/map.jinja" import ntp with context %}
{% set client = ntp.client %}

ntp-client:
  pkg.installed:
    - pkgs: {{ client.pkgs }}
  service.running:
    - name: {{ client.svc }}
    - enable: True
    - require:
      - pkg: ntp-client

