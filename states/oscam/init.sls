#/etc/systemd/system/oscam.service:
  #  file.managed:
    #  - user: root
    #- group: root 
    #- mode: 400
    #- source: salt://oscam/templates/oscam.service

oscam:
  file.managed:
    - name: /etc/systemd/system/oscam.service
    - user: root
    - group: root 
    - mode: 400
    - source: salt://oscam/templates/oscam.service
  service.running:
    - require: 
      - file: /etc/systemd/system/oscam.service
    - enable: True
