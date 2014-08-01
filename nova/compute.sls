{%- from "nova/map.jinja" import nova with context %}

include:
  - .base
  - .conf

nova-compute:
  pkg.installed:
    - refresh: False
    - pkgs: {{ nova.compute_pkgs }}
    - require_in:
      - file: /etc/nova/nova.conf
  service.running:
    - enable: True
    - restart: True
    - names: {{ nova.compute_services }}
    - require:
      - pkg: nova-compute
      - file: /etc/nova/nova.conf
    - watch:
      - file: /etc/nova/nova.conf
