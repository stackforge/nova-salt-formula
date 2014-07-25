{% set name="nova" %}

{{ name }}-db:
  mysql_database.present:
    - name: {{ name }}
  mysql_user.present:
    - name: {{ name }}
    - host: "{{ salt["pillar.get"](name + ":mysql:host","localhost") }}"
    - password: {{ salt["pillar.get"](name + ":mysql:password") }}
  mysql_grants.present:
    - host: "{{ salt["pillar.get"](name + ":mysql:host","localhost") }}"
    - grant: all privileges
    - database: "{{ name }}.*"
    - user: {{ name }}
