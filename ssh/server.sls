{% from "ssh/map.jinja" import ssh with context %}
{% set server = ssh.server %}

ssh_server:
  pkg.installed:
    - pkgs: {{ server.pkgs }}
  service.running:
    - name: {{ server.svc_name }}
    - enable: True
    - watch:
      - file: ssh_server_config

ssh_server_config:
  file.managed:
    - name: {{ server.files.cfg.name }}
    - source: {{ server.files.cfg.source }}
    - owner: root
    - group: root
    - mode: 0644
    - template: jinja
