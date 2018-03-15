prometheus-node-exporter:
  pkg.installed:
    - version: latest
  service.running:
    - name: prometheus-node-exporter
    - watch:
      - pkg: prometheus-node-exporter
    - enable: true
    - reload: true
