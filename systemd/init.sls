{% from "systemd/map.jinja" import systemd with context %}

systemd-user:
  file.exists:
    - name: {{ systemd.dirs.user }}

