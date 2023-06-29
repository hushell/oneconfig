# BAI begin
FROM 106.1.209.22:7080/bai/ngc-pytorch:22.12-py3

MAINTAINER shell.hu@samsung.com

RUN ln -sf /usr/share/terminfo/x/xterm-color /usr/share/terminfo/x/xterm-256color

# Backend.AI specifics
LABEL ai.backend.kernelspec="1" \
      ai.backend.envs.corecount="" \
      ai.backend.features="uid-match" \
      ai.backend.resource.min.cpu="1" \
      ai.backend.resource.min.mem="64m" \
      ai.backend.resource.preferred.shmem="256m" \
      ai.backend.accelerators="" \
      ai.backend.base-distro="ubuntu" \
      ai.backend.service-ports="nni:preopen:8080,mlflow-ui:preopen:5000,vscode:http:8180,tensorboard:http:6006,jupyterlab:http:8090,jupyter:http:8081" \
      ai.backend.runtime-type="python" \
      ai.backend.runtime-path="python3"
# BAI end

##-----------------anibali/pytorch:2.0.0-cuda11.8-------------------
#FROM nvidia/cuda:11.8.0-base-ubuntu22.04
#
#ENV http_proxy http://106.1.147.165:8080
#ENV https_proxy http://106.1.147.165:8080 
#
## Remove any third-party apt sources to avoid issues with expiring keys.
#RUN rm -f /etc/apt/sources.list.d/*.list
#
## Install some basic utilities.
#RUN apt-get update && apt-get install -y \
#    curl \
#    ca-certificates \
#    sudo \
#    git \
#    bzip2 
##    libx11-6 \
##&& rm -rf /var/lib/apt/lists/*
#
## Create a working directory.
#RUN mkdir /app
#WORKDIR /app
#
## Create a non-root user and switch to it.
#RUN adduser --disabled-password --gecos '' --shell /bin/bash user \
# && chown -R user:user /app
#RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
#USER user
#
## All users can use /home/user as their home directory.
#ENV HOME=/home/user
#RUN mkdir $HOME/.cache $HOME/.config \
# && chmod -R 777 $HOME

#-----------------apt-get-------------------
#RUN apt-get update -y

#ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update && apt-get install -y \
    build-essential pkg-config cmake gcc g++ ctags \
    software-properties-common python3-dev \
    libopenmpi-dev openmpi-bin \
    ssh vim screen htop wget tree \
    git bash-completion zip unzip \
    libjpeg-dev libpng-dev libsndfile1 ffmpeg

# Cleaning
RUN apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /root/.cache \
    && rm -rf /var/lib/apt/lists/*

#-----------------torch CUDA 11.8-------------------
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

#-----------------bash & vim & pip-------------------
# keep in mind that each RUN starts in the default WORKDIR
RUN echo "home dir: $HOME" \
    && git clone https://github.com/hushell/oneconfig /tmp/oneconfig \
    && cd /tmp/oneconfig \
    && echo "current dir: $(pwd)" \
    && source bashrc \
    && pip install -r requirements_docker.txt \
    && cd vim_runtime \
    && echo "current dir: $(pwd)" \
    && chmod +x install_awesome_vimrc.sh \
    && ./install_awesome_vimrc.sh 

#-----------------default command tool-------------------
CMD [ "/bin/bash" ]
