docker build . -t autocert-bootstrapper -f bootstrapper/Dockerfile $*
docker build . -t autocert-renewer -f renewer/Dockerfile $*