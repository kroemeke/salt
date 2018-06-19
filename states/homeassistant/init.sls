homeassistant:
  group.present:
    - gid: 5000
  user.present:
    - uid: 5000
    - gid: 5000
    - home: /home/homeassistant
    - password: {{ pillar.homeassistant.user.password }}
  file.directory:
    - user: homeassistant
    - group: homeassistant
    - name: /srv/homeassistant
  pkg.latest:
    - name: python3-venv
  file.managed:
    - name: /etc/systemd/system/homeassistant.service
    - user: root
    - group: root
    - mode: 400
    - source: salt://homeassistant/templates/homeassistant.service
  service.running:
    - require:
      - file: /etc/systemd/system/homeassistant.service
      - cmd: venv_run_hass
    - enable: True

venv:
  cmd.run:
    - name: python3 -m venv /srv/homeassistant
    - require:
      - pkg: python3-venv
      - user: homeassistant
    - creates: /srv/homeassistant/pyvenv.cfg
    - runas: homeassistant

venv_install:
  cmd.run:
    - name: source bin/activate ; python3 -m pip install wheel
    - cwd: /srv/homeassistant
    - require:
      - cmd: venv
    - creates: /srv/homeassistant/lib/python3.5/site-packages/wheel/__init__.py
    - runas: homeassistant

venv_install_ha:
  cmd.run:
    - name: source bin/activate ; pip3 install homeassistant
    - cwd: /srv/homeassistant
    - require:
      - cmd: venv_install
    - creates: /srv/homeassistant/lib/python3.5/site-packages/homeassistant/__init__.py
    - runas: homeassistant


venv_run_hass:
  cmd.run:
    - name: source bin/activate ; hass
    - cwd: /srv/homeassistant
    - require:
      - cmd: venv_install_ha
    - creates: /srv/homeassistant/lib/python3.5/site-packages/gtts_token/__init__.py
    - runas: homeassistant

