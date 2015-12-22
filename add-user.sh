#!/bin/bash -x

INITIAL_USER=initial

useradd -m -u ${EXTERNAL_USER_ID} ${INITIAL_USER}
chown -R ${INITIAL_USER}:${INITIAL_USER} /home/${INITIAL_USER}/
exit
