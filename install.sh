#!/bin/bash

if [[ "$(whoami)" != "root" ]]; then
    echo "Must be run with root privileges" >&2
    exit 1
fi

BINDIR="/bin/wombsounds"
ETCDIR="/etc/wombsounds"

if [[ ! -e "${ETCDIR}" ]]; then
    mkdir -v "${ETCDIR}"
fi
if [[ ! -e "${BINDIR}" ]]; then
    mkdir -v "${BINDIR}"
fi

cp -v wombsounds.conf ${ETCDIR}
cp -v wombsounds ${BINDIR}
cp -v wombsounds.service /etc/systemd/system
systemctl daemon-reload

