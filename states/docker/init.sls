#add_docker_gpg:
  #  cmd.run:
    #    - name: "wget -q -O -  https://download.docker.com/linux/debian/gpg | apt-key --keyring /etc/apt/trusted.gpg.d/docker.gpg add -"
    #    - unless: test -s /etc/apt/trusted.gpg.d/docker.gpg

docker_repo:
  pkgrepo.managed:
    - name: deb https://download.docker.com/linux/debian stretch stable
    - key_url: https://download.docker.com/linux/debian/gpg
    - file: /etc/apt/sources.list.d/docker.list

