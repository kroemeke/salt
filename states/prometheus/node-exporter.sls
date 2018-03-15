prometheus-node-exporter:
  pkg.installed:
    - version: latest
  service.running:
    - name: prometheus-node-exporter
    - watch:
      - pkg: prometheus-node-exporter
      - file: /etc/default/prometheus-node-exporter
    - enable: true
    - reload: true
  file.managed:
    - name: /etc/default/prometheus-node-exporter
    - source: salt://prometheus/prometheus-node-exporter.jinja
    - user: root
    - group: root
    - mode: 400
