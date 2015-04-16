{% set pacman = salt['pillar.get']('pacman:lookup') %}

pacman_conf:
  file.managed:
    - name: {{ pacman.conf.path }}
    - source: {{ pacman.conf.tmpl }}
    - template: jinja
    - user: root
    - group: root
    - mode: 0644

