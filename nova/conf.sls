/etc/nova/nova.conf:
  file.managed:
    - source: salt://nova/files/nova.conf
    - template: jinja
