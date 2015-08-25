{% from "prometheus/map.jinja" import prometheus with context %}
{% set server = prometheus.server %}

include:
  - prometheus.user

prometheus-server-archive:
  archive.extracted:
    - name: {{ server.dir.bin }}
    - source: {{ server.src.url }}
    - source_hash: {{ server.src.hash }}
    - archive_format: {{ server.src.format }}
    - if_missing: {{ server.dir.bin }}/{{ server.bin }}
    - require:
      - file: prometheus-server-dir-bin

prometheus-server-dir-bin:
  file.directory:
    - name: {{ server.dir.bin }}
    - user: root
    - group: root
    - mode: 0755

prometheus-server-dir-conf:
  file.directory:
    - name: {{ server.dir.conf }}
    - user: root
    - group: root
    - mode: 0755

prometheus-server-dir-rules:
  file.directory:
    - name: {{ server.dir.conf }}/rules.d
    - user: root
    - group: root
    - mode: 0755
    - require:
      - file: prometheus-server-dir-conf

prometheus-server-dir-data:
  file.directory:
    - name: {{ server.dir.data }}
    - user: {{ prometheus.user }}
    - group: {{ prometheus.group }}
    - mode: 0755
    - require:
      - sls: prometheus.user

prometheus-server-unit:
  file.managed:
    - name: {{ server.unit.dest }}
    - source: {{ server.unit.src }}
    - template: jinja
    - user: root
    - group: root
    - mode: 0644

