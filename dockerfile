FROM jenkins/jenkins:2.462.3-lts-jdk17

USER root

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    flake8 \
    nodejs \
    npm \
    build-essential \
    curl \
    && apt-get clean

RUN npm install -g eslint

USER jenkins

CMD ["/usr/local/bin/jenkins.sh"]
