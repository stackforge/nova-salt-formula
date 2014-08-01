{%- from "nova/map.jinja" import nova with context %}

pkg-utils:
  pkg.installed:
    - refresh: False
    - pkgs:
      - sysfsutils
      - {{ nova.conntrack }}
