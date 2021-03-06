FROM ubuntu:14.04
MAINTAINER rchong "ronachong@gmail.com" and wmccann "william.mccann@holbertonschool.com"

### adapted from kchengw's Dockerfile:
#### https://github.com/kchen-tw/docker_neural-style/blob/master/Dockerfile

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y curl wget software-properties-common
RUN apt-get install -y git

# Install torch7,
### following (NEW) directions in http://torch.ch/docs/getting-started.html#_
WORKDIR /root
RUN git clone https://github.com/torch/distro.git /root/torch --recursive
WORKDIR /root/torch
RUN bash install-deps
RUN ./install.sh -b
# RUN source /root/.bashrc commented out due to redundancy

# Install loadcaffe
RUN apt-get install -y libprotobuf-dev protobuf-compiler
RUN /root/torch/install/bin/luarocks install loadcaffe

# Install neural-style
WORKDIR /root
RUN git clone --depth 1 https://github.com/jcjohnson/neural-style.git

WORKDIR /root/neural-style
RUN bash models/download_models.sh

############### additional code by In It To Win It ###############

RUN touch run-ns-in-ens.py
RUN curl -s https://raw.githubusercontent.com/ronachong/easy-neural-style/master/run-ns-in-ens.py > /root/neural-style/run-ns-in-ens.py

CMD ["python", "run-ns-in-ens.py"]