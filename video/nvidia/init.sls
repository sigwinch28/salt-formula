{% from "video/nvidia/map.jinja" import nvidia with context %}

nvidia:
  pkg.installed:
    - pkgs: {{ nvidia.driver.pkgs }}

