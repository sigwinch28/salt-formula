{% from "prometheus/map.jinja" import prometheus with context %}
{% set server = prometheus.server %}

include:
  - .install

prometheus-server:
  service.running:
    - name: {{ server.svc }}
    - enable: true
    - watch:
      - file: prometheus-server
    - require:
      - sls: prometheus.server.install
  file.managed:
    - name: {{ server.dir.conf }}/config.yml
    - source: {{ server.conf.tmpl }}
    - template: jinja
    - content: {{ prometheus.config }}
    - user: root
    - group: root
    - mode: 0644
    - require:
      - sls: prometheus.server.install
