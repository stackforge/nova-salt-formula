include:
  - .base
  - .conf

nova-network:
  pkg.installed:
    - refresh: False
    - pkgs:
      - nova-network
      - nova-api-metadata
    - require_in:
      - file: /etc/nova/nova.conf
  service.running:
    - enable: True
    - restart: True
    - names:
      - nova-network
      - nova-api-metadata
    - require:
      - pkg: nova-network
    - watch:
      - file: /etc/nova/nova.conf

nova-compute:
  pkg.installed:
    - refresh: False
    - pkgs:
      - nova-compute
      - nova-compute-{{ salt['pillar.get']('nova:config:libvirt:virt_type', 'kvm') }}
    - require_in:
      - file: /etc/nova/nova.conf
  service.running:
    - enable: True
    - restart: True
    - names:
      - nova-compute
    - require:
      - pkg: nova-compute
      - file: /etc/nova/nova.conf
    - watch:
      - file: /etc/nova/nova.conf
