{%- from "openstack/map.jinja" import node with context %}
{%- set name="nova" %}

keystone_{{ name }}_user:
  keystone.user_present:
    - name: {{ name }}
    - password: {{ salt["pillar.get"](name + ":keystone:password") }}
    - email: {{ salt["pillar.get"](name + ":keystone:email", name + "@localhost.nolocal")}}
    - tenant: service
    - enable: True
    - roles: 
      - service:
        - admin

keystone_{{ name }}_service:
  keystone.service_present:
    - name: {{ name }}
    - service_type: compute
    - description: Openstack Compute Service

keystone_{{ name }}_endpoint:
  keystone.endpoint_present:
    - name: {{ name }}
    - publicurl: http://{{ salt["pillar.get"](name + ":public_ip") }}:8774/v2/%(tenant_id)s
    - internalurl: http://{{ salt["pillar.get"](name + ":internal_ip") }}:8774/v2/%(tenant_id)s
    - adminurl: http://{{ salt["pillar.get"](name + ":admin_ip") }}:8774/v2/%(tenant_id)s
