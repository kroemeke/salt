add_docker_gpg:
  cmd.run:
    - name: "wget -q -O -  https://download.docker.com/linux/debian/gpg | apt-key --keyring /etc/apt/trusted.gpg.d/docker.gpg add -"/
    - unless: test -s /etc/apt/trusted.gpg.d/docker.gpg
