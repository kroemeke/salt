prometheus:
  file.managed:
    - name: /etc/systemd/system/prometheus.service
    - user: root
    - group: root 
    - mode: 400
    - source: salt://prometheus/templates/prometheus.service.jinja
  service.running:
    - require: 
      - file: /etc/systemd/system/prometheus.service
    - enable: True
