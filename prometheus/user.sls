{% from "prometheus/map.jinja" import prometheus with context %}

prometheus-user:
  user.present:
    - name: {{ prometheus.user }}
    - createhome: false
    - home: /var/lib/prometheus
    - gid_from_name: true
    - system: true

