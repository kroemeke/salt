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

{%- for vhost in pillar.nginx.vhosts %}
{{ vhost }}:
  file.managed:
    - name: /etc/nginx/conf.d/{{ vhost }}.conf
    - user: root
    - group: root
    - mode: 444
    - source: salt://nginx/templates/vhost.jinja
    - template: jinja
    - makedirs: true
    - require_in:
      - service: nginx
    - context:
      server_name: {{ vhost }}
      port: {{ vhost.port }}
      address: {{ vhost.address }}
{%- endfor %}
