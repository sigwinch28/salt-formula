video_driver:
  pkg.installed:
    - name: nvidia
    - require:
      - pkg: nvidia_libgl

nvidia_libgl:
  pkg.installed:
    - name: lib32-nvidia-libgl

nvidia_vdpau:
  pkg.installed:
    - name: libvdpau

