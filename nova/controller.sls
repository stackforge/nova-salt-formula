{%- from "nova/map.jinja" import nova with context %}

include:
  - .base
  - .db
  - .keystone
  - .conf

nova:
  pkg.installed:
    - refresh: False
    - pkgs: {{ nova.controller_pkgs }}
  service.running:
    - enable: True
    - restart: True
    - names: {{ nova.controller_services }}
    - require:
      - pkg: nova
    - watch:
      - file: /etc/nova/nova.conf

nova_db_sync:
  cmd.run:
    - name: nova-manage db sync
    - require:
      - file: /etc/nova/nova.conf
