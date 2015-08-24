{% from "nfs/map.jinja" import nfs with context %}
{% set server = nfs.server %}

include:
  - ntp.client

nfs-server:
  pkg.installed:
    - pkgs: {{ server.pkgs }}
  file.managed:
    - name: {{ server.conf.path }}
    - source: {{ server.conf.tmpl }}
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: nfs-server
  service.running:
    - name: {{ server.svc }}
    - enable: true
    - require:
      - sls: ntp.client
    - watch:
      - file: nfs-server
      - pkg: nfs-server

nfs-exports:
  file.managed:
    - name: {{ server.exports.path }}
    - source: {{ server.exports.tmpl }}
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: nfs-server

nfs-exports-reload:
  cmd.wait:
    - name: {{ server.exports.cmd.reload }}
    - watch:
      - file: nfs-exports
    - require:
      - pkg: nfs-server

