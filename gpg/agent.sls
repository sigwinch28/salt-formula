{% from "gpg/map.jinja" import gpg with context %}
{% from "systemd/map.jinja" import systemd with context %}

include:
  - gpg
  - systemd

gpg-unit-user:
  file.managed:
    - name: {{ systemd.dirs.user }}/{{ gpg.units.user.name }}
    - source: {{ gpg.units.user.source }}
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: gpg
      - file: systemd-user

