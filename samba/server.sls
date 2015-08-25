{% from "samba/map.jinja" import samba with context %}
{% set server = samba.server %}

samba-server:
  pkg.installed:
    - pkgs: {{ server.pkgs }}
  file.managed:
    - name: {{ server.conf.dest }}
    - source: {{ server.conf.src }}
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: samba-server

{% for svc in server.svcs %}
samba-service-{{ svc }}:
  service.running:
    - name: {{ svc }}
    - enable: true
    - require:
      - pkg: samba-server
    - watch:
      - file: samba-server
{% endfor %}
