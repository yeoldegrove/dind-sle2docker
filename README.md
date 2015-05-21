# dind-sle2docker
This is a set of patches to build a SLE docker image.

This can be used on any machine running docker. No suse distribution is needed.

This can be accomplished, because we can run dind (docker in docker).

It is based on https://github.com/jpetazzo/dind



##how to use:

build opensuse image...
```
./build-sle2docker.sh
```
...wait until opensuse image is build

start opensuse container to build SLE image...
```
docker run -t -i --privileged sle2docker sle2docker build -s <repo IP/url> (--disable-https) SLE11SP2|SLE11SP3|SLE12
```
...wait until SLES image is build

copy buils SLE image to "real" docker host...
```
docker cp 'containerID':/tmp/sle2docker*/result/*.tbz 'wherever you want'
```

import docker image on "real" docker host...
```
docker import - 'imagename' <file.tbz
```

start docker SLE container...
```
docker run -t -i 'imagename' bash
```
