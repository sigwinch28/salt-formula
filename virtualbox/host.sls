{% from "virtualbox/map.jinja" import virtualbox with context %}

{% set host = virtualbox.host %}

virtualbox_host:
  pkg.installed:
    - pkgs: {{ host.pkgs }}

{% if grains['os'] == 'Arch' %}
virtualbox_modules:
  kmod.present:
    - names: {{ host.modules }}
    - persist: False

virtualbox_modules_load:
  file.managed:
    - name: /etc/modules-load.d/virtualbox.conf
    - source: salt://virtualbox/files/arch/modules.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
      modules: {{ host.modules }}
{% endif %}
