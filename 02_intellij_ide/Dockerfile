FROM jpmaree/optimization_engine:latest

MAINTAINER Phillip Maree <phillip.maree@sintef.no>

ARG USER_NAME

ARG IDEA_VERSION=2020.1
ARG IDEA_BUILD=201.6487.11

ARG idea_source=https://download.jetbrains.com/idea/ideaIC-${IDEA_BUILD}.tar.gz
ARG idea_local_dir=.IdeaIC${IDEA_VERSION}

# working directory setup

WORKDIR /scratch

# install intellij

RUN apt-get update && apt-get install -y curl

WORKDIR /opt/idea

RUN curl -fsSL $idea_source -o /opt/idea/installer.tgz \
  && tar --strip-components=1 -xzf installer.tgz

# create user working directory

RUN useradd -ms /bin/bash $USER_NAME
USER $USER_NAME
WORKDIR /home/$USER_NAME

CMD [ "/opt/idea/bin/idea.sh" ]

#docker build --rm -f Dockerfile --build-arg USER_NAME=$USER -t jpmaree/optimization_ide:latest .