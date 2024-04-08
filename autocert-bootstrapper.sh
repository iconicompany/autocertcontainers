rm -rf .step; mkdir -p .step
docker run \
  -it \
  --rm \
  --mount type=bind,source=$PWD/.step,destination=/var/run/autocert.step.sm \
  --env-file .env \
  autocert-bootstrapper $*
#  --mount type=bind,source=$HOME/.step/certs/root_ca.crt,destination=/var/run/autocert.step.sm/root.crt \
