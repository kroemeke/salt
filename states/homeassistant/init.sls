groups:
  homeassistant:
    gid: 5000

users:
  homeassistant:
    fullname: Home Assistant
    uid: 5000
    gid: 5000
    shell: /bin/bash
    home: /home/homeassistant
    groups:
      - admin
    password: {% pillar.homeassistant.user.password -%} 
    enforce_password: True
    key.pub: True
