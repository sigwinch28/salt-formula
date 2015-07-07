{% from "ssh/map.jinja" import ssh with context %}
{% set client = ssh.client %}

ssh-client:
  pkg.installed:
    - pkgs: {{ client.pkgs }}

