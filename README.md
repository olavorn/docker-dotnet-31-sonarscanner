# .Net Core Sonar Scanner on Docker Container

Sonar Scanner Image for .Net Core Projects

[![Docker Pulls](https://img.shields.io/docker/pulls/olavorn/docker-dotnet-31-sonarscanner.svg)](https://hub.docker.com/repository/docker/olavorn/docker-dotnet-31-sonarscanner/) [![Docker Automated build](https://img.shields.io/docker/automated/olavorn/docker-dotnet-31-sonarscanner.svg)](https://hub.docker.com/repository/docker/olavorn/docker-dotnet-31-sonarscanner/) 

## This Image Using

|                | Name          | Version       |
| -------------- |:-------------:| -------------:|
| OS             | RedHat        |          UBI8 |
| Java           | OpenJDK       |  8 Update 171 |
| .NET SDK       | .NET Core SDK |           3.1 |
| Sonar Scanner For DotNet Core | CLI           |    3.2.0.1227 |


Please check [Releases Page](https://github.com/burakince/docker-dotnet-sonarscanner/releases) for details.

## Source Image

[Latest RedHat](https://catalog.redhat.com/software/containers/rhel8/dotnet-31/5de595e7d70cc51644a54aef?container-tabs=overview&gti-tabs=registry-tokens)

[Latest OpenJDK](https://hub.docker.com/r/library/openjdk/tags/)

## Using Example

First of all you need a sonarqube server. If you haven't one, run this code;

```
docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube
```

And then you need .Net Core project. If you haven't one, run this codes;

```
mkdir ConsoleApplication1
cd ConsoleApplication1

dotnet new console
dotnet new sln
dotnet sln ConsoleApplication1.sln add ConsoleApplication1.csproj
```

Take login token from sonarqube server, change working directory to project directory and run this code;

Example using in Gitlab gitlab-ci.yml
```
...

qa:
  image: olavorn/docker-dotnet-31-sonarscanner
  script:
    - dotnet restore
    - dotnet sonarscanner begin /k:"$SONAR_PROJECT_KEY" /d:sonar.login="$SONAR_TOKEN" /d:sonar.host.url=http://sonar:9000
    - dotnet build --no-restore -c Release
    - dotnet sonarscanner end /d:sonar.login="$SONAR_TOKEN" 
  
```
