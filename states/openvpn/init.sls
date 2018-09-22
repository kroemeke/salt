openvpn:
  file.managed:
    - name: /etc/systemd/system/openvpn.service
    - user: root
    - group: root 
    - mode: 400
    - source: salt://openvpn/templates/openvpn.service
  service.running:
    - require: 
      - file: /etc/systemd/system/openvpn.service
    - enable: True
