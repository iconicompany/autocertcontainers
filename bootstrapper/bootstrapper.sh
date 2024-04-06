#!/bin/sh
P12="/var/run/autocert.step.sm/site.p12"

if [ -f "$STEP_ROOT" ];
then
    echo "Found existing $STEP_ROOT, skipping bootstrap"
    exit 0
fi

# Download the root certificate and set permissions
if [ "$DURATION" == "" ];
then
    step ca certificate $COMMON_NAME $CRT $KEY
else
    step ca certificate --not-after $DURATION $COMMON_NAME $CRT $KEY
fi

step certificate p12 $P12 $CRT $KEY --no-password --insecure

step ca root $STEP_ROOT

if [ -n "$OWNER" ]
then
    chown "$OWNER" $CRT $KEY $STEP_ROOT $P12
fi

if [ -n "$MODE" ]
then
    chmod "$MODE" $CRT $KEY $STEP_ROOT $P12
else
    chmod 644 $CRT $KEY $STEP_ROOT $P12
fi

