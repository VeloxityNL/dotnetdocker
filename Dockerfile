# ----------------------------------
# Pterodactyl .NET Dockerfile
# Environment: Ubuntu 20.04
# Minimum Panel Version: 1.0.0
# ----------------------------------
FROM ubuntu:focal

LABEL maintainer="Veloxity#0001"
RUN apt update && apt install wget -y
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb
RUN apt update && apt install apt-transport-https dotnet-sdk-6.0 -y
RUN dotnet --version

RUN adduser --disabled-password --gecos "" --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

CMD ["/bin/bash", "./StartIW4MAdmin.sh"]
