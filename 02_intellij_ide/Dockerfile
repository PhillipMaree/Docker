FROM jpmaree/optimization_engine:latest

MAINTAINER Phillip Maree <phillip.maree@sintef.no>

ARG USER_NAME

ARG IDEA_VERSION=2020.1
ARG IDEA_BUILD=201.6487.11

ARG idea_source=https://download.jetbrains.com/idea/ideaIC-${IDEA_BUILD}.tar.gz
ARG idea_local_dir=.IdeaIC${IDEA_VERSION}

RUN apt-get update && apt-get install -y \
    lsb-release \
    curl \
    chromium-browser \
    screen

# install intellij

WORKDIR /opt/idea

RUN curl -fsSL $idea_source -o /opt/idea/installer.tgz \
  && tar --strip-components=1 -xzf installer.tgz

# symbolic link for intellij

RUN ln -s /opt/idea/bin/idea.sh /usr/bin/intellij

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


