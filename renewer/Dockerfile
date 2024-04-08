FROM smallstep/step-cli:0.23.1

USER root
ENV CRT="/var/run/autocert.step.sm/site.crt"
ENV KEY="/var/run/autocert.step.sm/site.key"
ENV STEP_ROOT="/var/run/autocert.step.sm/root.crt"
ENV P12="/var/run/autocert.step.sm/site.p12"

ENTRYPOINT ["/bin/bash", "-c", "step ca renew --daemon --exec \"step certificate p12 $P12 $CRT $KEY --no-password --insecure\" $CRT $KEY"]
