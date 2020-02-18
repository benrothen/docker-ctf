# docker-ctf

Dockerfile for playing CTF based on Ubuntu 18.04

## How to use:
```
docker build -t docker-ctf . | tee build.log
docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name docker-ctf -i docker-ctf
docker exec -it docker-ctf /bin/bash
```

## TODO:
- add custom dotfiles

## Sources:
- https://github.com/LiveOverflow/pwn_docker_example/
- https://github.com/ss8651twtw/docker-ctf
- https://github.com/inaz2/ctfbox
