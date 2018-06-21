mosquitto:
  pkg.installed:
    - version: latest
  service.running:
    - require:
      - pkg: mosquitto
    - watch:
      - file: /etc/mosquitto/mosquitto.conf
      - file: /etc/mosquitto/mosquitto_pass.conf
      - pkg: mosquitto

/etc/mosquitto/mosquitto.conf:
  file.managed:
    - name: /etc/mosquitto/mosquitto.conf
    - user: root
    - group: root
    - mode: 400
    - source: salt://homeassistant/templates/mosquitto.conf
    - require:
      - pkg: mosquitto

/etc/mosquitto/mosquitto_pass.conf:
  file.managed:
    - name: /etc/mosquitto/mosquitto_pass.conf
    - user: root
    - group: root
    - mode: 400
    - source: salt://homeassistant/templates/mosquitto_pass.conf
    - template: jinja
    - require:
      - pkg: mosquitto
