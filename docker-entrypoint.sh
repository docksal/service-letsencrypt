#!/bin/bash
set -e

if [[ "$@" == "" ]]
then
    crond
    while true
    do
	sleep 100
    done
fi

exec "$@"

