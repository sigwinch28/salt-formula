{% from "vpn/map.jinja" import vpn with context %}

include:
  - pki.ca
  - pki.host
  - vpn

{% for name, server in vpn.servers.iteritems() %}
vpn-config-server-{{ name }}:
  file.managed:
    - name: {{ vpn.conf_dir }}/{{ name }}-server.conf
    - source: {{ vpn.conf.server.tmpl }}
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - context:
        name: {{ name }}

vpn-service-server-{{ name }}:
  service.running:
    - name: {{ vpn.svc }}@{{ name }}-server
    - enable: true
    - require:
      - sls: vpn
      - sls: pki.ca
      - sls: pki.host
    - watch:
      - file: vpn-config-server-{{ name }}
{% endfor %}

