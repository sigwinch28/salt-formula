{% from "video/nvidia/map.jinja" import nvidia with context %}

video-driver:
  pkg.installed:
    - pkgs: {{ nvidia.driver.pkgs }}

