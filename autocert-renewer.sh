docker run \
  -it \
  --rm \
  --mount type=bind,source=$PWD/.step,destination=/var/run/autocert.step.sm \
  --env-file .env \
  autocert-renewer $*
 