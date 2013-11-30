#!/bin/sh
set -e

if ! yum list installed | grep -q rsync; then
  sudo yum -y install rsync
fi

