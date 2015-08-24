{% from "vpn/map.jinja" import vpn with context %}

include:
  - pki.ca
  - pki.host
  - vpn

{% for name, client in vpn.clients.iteritems() %}
vpn-config-client-{{ name }}:
  file.managed:
    - name: {{ vpn.conf_dir }}/{{ name }}-client.conf
    - source: {{ vpn.conf.client.tmpl }}
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - context:
        name: {{ name }}

vpn-service-client-{{ name }}:
  service.running:
    - name: {{ vpn.svc }}@{{ name }}-client
    - enable: true
    - require:
      - sls: vpn
      - sls: pki.ca
      - sls: pki.host
    - watch:
      - file: vpn-config-client-{{ name }}
{% endfor %}

