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
      - file: /etc/oscam/oscam.server
      - file: /etc/oscam/oscam.user
    - enable: True

oscam.servers:
  file.managed:
    - name: /etc/oscam/oscam.server
    - user: root
    - group: root
    - mode: 444
    - source: salt://oscam/templates/oscam.server.jinja
    - makedirs: True
    - template: jinja

oscam.user:
  file.managed:
    - name: /etc/oscam/oscam.user
    - user: root
    - group: root
    - mode: 444
    - source: salt://oscam/templates/oscam.user.jinja
    - makedirs: True
    - template: jinja

