FROM jpmaree/optimization_engine:latest

MAINTAINER Phillip Maree <phillip.maree@sintef.no>

ARG USER_NAME

ARG IDEA_BUILD=2020.1
ARG idea_source=https://download.jetbrains.com/idea/ideaIU-${IDEA_BUILD}.tar.gz

ARG ECLIPSE_BUILD=2020-03
ARG eclipse_source=http://mirror.dkm.cz/eclipse/oomph/epp/${ECLIPSE_BUILD}/R/eclipse-inst-linux64.tar.gz

RUN apt-get update && apt-get install -y \
    lsb-release \
    curl \
    chromium-browser \
    screen

# install intellij

WORKDIR /opt/Idea

RUN curl -fsSL $idea_source -o /opt/Idea/installer.tgz && \
    tar --strip-components=1 -xzf installer.tgz && \
    ln -s /opt/Idea/bin/idea.sh /usr/bin/intellij

# install eclipse

WORKDIR /opt/Eclipse

RUN wget $eclipse_source -O installer.tar.gz && \
    tar --strip-components=1 -xvzf installer.tar.gz && \
    ln -s /opt/Eclipse/eclipse-inst /usr/bin/eclipse-inst

# install openmodelica

RUN for deb in deb deb-src; do echo "$deb http://build.openmodelica.org/apt `lsb_release -cs` nightly"; done | sudo tee /etc/apt/sources.list.d/openmodelica.list && \
    wget -q http://build.openmodelica.org/apt/openmodelica.asc -O- | sudo apt-key add - && \
    apt-get update && sudo apt upgrade -y && \
    apt-get install openmodelica -y

# create user working directory

RUN useradd -m -d /home/${USER_NAME} ${USER_NAME} && \
    chown -R ${USER_NAME} /home/${USER_NAME} && \
    adduser ${USER_NAME} sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


USER $USER_NAME
ARG workdir=/home/$USER_NAME
WORKDIR $workdir


