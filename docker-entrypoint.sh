#!/bin/sh

# if command starts with an option or something that is not executable, prepend manuale
if [ "${1:0:1}" = "-" ] || ! which "${1}" >/dev/null; then
  set -- manuale "$@"
fi

exec "$@"
