{% from "ssh/map.jinja" import ssh with context %}
{% set client = ssh.client %}

ssh_client:
  pkg.installed:
    - pkgs: {{ client.pkgs }}

