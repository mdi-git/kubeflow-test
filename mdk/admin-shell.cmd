@echo off

set WORKDIR=%1
IF [%WORKDIR:~-1%]==[\] SET WORKDIR=%WORKDIR:~0,-1%
IF [%WORKDIR%] == [] (
   set SERVICE=docker-compose.yml
)
else (
   for %%f in (%WORKDIR%) do set SERVICE=%%~nxf
)

set HOME=%USERPROFILE%
mkdir %HOME%/.mdk-docker
docker-compose -f mdk\mdk-docker.yml run --service-ports --rm mdk-shell bash
