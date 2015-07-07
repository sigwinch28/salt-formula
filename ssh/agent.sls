{% from "ssh/map.jinja" import ssh with context %}
{% from "systemd/map.jinja" import systemd with context %}

include:
  - .client
  - systemd

ssh-unit-user:
  file.managed:
    - name: {{ systemd.dirs.user }}/{{ ssh.units.user.name }}
    - source: {{ ssh.units.user.source }}
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: ssh-client
      - file: systemd-user

