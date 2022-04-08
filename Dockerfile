FROM registry.access.redhat.com/ubi8/dotnet-60
USER root
LABEL maintainer="Olavo Rocha Neto <olavorn@gmail.com>"

RUN dotnet tool install --global dotnet-sonarscanner
RUN export PATH="$PATH:/opt/app-root/.dotnet/tools"

RUN yum install -y java-11-openjdk

RUN export PATH="$PATH:/opt/app-root/.dotnet/tools"
