FROM ubuntu:20.04


ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && \
    apt-get install -y git tar curl wget tmux && \
    rm -rf /var/lib/apt/lists/*


RUN git clone https://github.com/GentlemenValidators/Core-Blockchain /root/Core-Blockchain \
    && cd /root/Core-Blockchain \
    && git checkout main


WORKDIR /root/Core-Blockchain


CMD ./node-setup.sh --validator 1 && VALIDATOR_PASSWORD=$VALIDATOR_PASSWORD