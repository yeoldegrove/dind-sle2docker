#!/bin/bash
test -d dind || git clone https://github.com/yeoldegrove/dind.git
cp dind/wrapdocker dind/opensuse/Dockerfile .
patch -p2 wrapdocker <patch_wrapdocker.patch
patch -p2 Dockerfile <patch_Dockerfile.patch
docker build -t sle2docker .
if [ $? -eq 0 ]; then
    echo "$(tput setab 0)$(tput setaf 1)opensuse image for sle2docker created$(tput sgr 0)" && \
    echo "$(tput setab 0)$(tput setaf 1)to build a SLE container, use it like:$(tput sgr 0)" && \
    echo "$(tput setab 0)$(tput setaf 1)# docker run -t -i --privileged sle2docker sle2docker build -s <repo IP/url> (--disable-https) SLE11SP2|SLE11SP3|SLE12$(tput sgr 0)"
else
    echo "$(tput setab 0)$(tput setaf 1)something went wrong"
fi
rm -rf wrapdocker dind Dockerfile
