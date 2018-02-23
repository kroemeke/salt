/etc/systemd/system/oscam.service:
  file.managed:
    - user: root
    - group: root 
    - mode: 400
    - source: salt://oscam/templates/oscam.service
