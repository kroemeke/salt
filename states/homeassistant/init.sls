homeassistant:
  group.present:
    homeassistant:
      gid: 5000
  user.present:
    fullname: Home Assistant
    uid: 5000
    gid: 5000
    shell: /bin/bash
    home: /home/homeassistant
    groups:
      - homeassistant
    password: {{ pillar.homeassistant.user.password }}
    enforce_password: True
    key.pub: True
