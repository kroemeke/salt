homeassistant:
  group.present:
    - gid: 5000
  user.present:
    - uid: 5000
    - gid: 5000
    - home: /home/homeassistant
    - password: {{ pillar.homeassistant.user.password }}
