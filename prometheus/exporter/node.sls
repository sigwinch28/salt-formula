{% from "prometheus/map.jinja" import prometheus with context %}
{% set node = prometheus.exporter.node %}

include:
  - prometheus.user

prometheus-exporter-node:
  service.running:
    - name: {{ node.svc }}
    - enable: true
    - require:
      - sls: prometheus.user
      - archive: prometheus-exporter-node-archive
      - file: prometheus-exporter-node-unit

prometheus-exporter-node-archive:
  archive.extracted:
    - name: {{ node.dir }}
    - source: {{ node.src.url }}
    - source_hash: {{ node.src.hash }}
    - archive_format: {{ node.src.format }}
    - if_missing: {{ node.dir }}/{{ node.bin }}
    - require:
      - file: prometheus-exporter-node-dir

prometheus-exporter-node-dir:
  file.directory:
    - name: {{ node.dir }}
    - user: root
    - group: root
    - mode: 0755


prometheus-exporter-node-unit:
  file.managed:
    - name: {{ node.unit.dest }}
    - source: {{ node.unit.src }}
    - template: jinja
    - user: root
    - group: root
    - mode: 0644

