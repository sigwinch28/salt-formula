{% from "proxy/map.jinja" import proxy with context %}

proxy:
  pkg.installed:
    - pkgs: {{ proxy.pkgs }}
  file.managed:
    - name: {{ proxy.conf.path }}
    - source: {{ proxy.conf.tmpl }}
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: proxy
  service.running:
    - name: {{ proxy.svc }}
    - enable: true
    - watch:
      - file: proxy
      - pkg: proxy

