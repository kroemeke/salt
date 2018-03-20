nginx:
  file.managed:
    - name: /etc/systemd/system/nginx.service
    - user: root
    - group: root 
    - mode: 400
    - source: salt://nginx/templates/nginx.service.jinja
  service.running:
    - require: 
      - file: /etc/systemd/system/nginx.service
    - enable: True
