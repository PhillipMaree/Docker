FROM jpmaree/optimization_engine:latest

MAINTAINER Phillip Maree <phillip.maree@sintef.no>

ARG USER_NAME

# intellij IDEA repo mirror

ARG IDEA_BUILD=2020.1
ARG idea_source=https://download.jetbrains.com/idea/ideaIU-${IDEA_BUILD}.tar.gz

# eclipse repo mirror

ARG ECLIPSE_VERSION=2020-03
ARG eclipse_source=http://mirrors.uniri.hr/eclipse//technology/epp/downloads/release/${ECLIPSE_VERSION}/R/eclipse-cpp-${ECLIPSE_VERSION}-R-incubation-linux-gtk-x86_64.tar.gz

# generic packages

RUN apt-get update && apt-get install -y \
    lsb-release \
    curl \
    chromium-browser \
    screen

# install intellij

WORKDIR /opt/Idea

RUN curl -fsSL $idea_source -o installer.tgz && \
    tar --strip-components=1 -xzf installer.tgz && \
    ln -s /opt/Idea/bin/idea.sh /usr/bin/intellij

# install eclipse

WORKDIR /opt/Eclipse

RUN wget $eclipse_source -O installer.tar.gz && \
    tar --strip-components=1 -xvzf installer.tar.gz && \
    ln -s /opt/Eclipse/eclipse /usr/bin/eclipse

# install openmodelica

RUN for deb in deb deb-src; do echo "$deb http://build.openmodelica.org/apt `lsb_release -cs` nightly"; done | sudo tee /etc/apt/sources.list.d/openmodelica.list && \
    wget -q http://build.openmodelica.org/apt/openmodelica.asc -O- | sudo apt-key add - && \
    apt-get update && sudo apt upgrade -y && \
    apt-get install openmodelica -y

# install gnuplot iostream interface

WORKDIR /opt/Matplot

RUN git clone https://github.com/lava/matplotlib-cpp.git ./ && make && cp ./matplotlibcpp.h /usr/include/

# create user working directory

RUN useradd -m -d /home/${USER_NAME} ${USER_NAME} && \
    chown -R ${USER_NAME} /home/${USER_NAME} && \
    adduser ${USER_NAME} sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER $USER_NAME
ARG workdir=/home/$USER_NAME
WORKDIR $workdir


