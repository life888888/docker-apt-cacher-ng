#!/bin/bash

mkdir -p /extval/var/log/apt-cacher-ng
chown apt-cacher-ng:apt-cacher-ng /extval/var/log/apt-cacher-ng
chmod 755 /extval/var/log/apt-cacher-ng
chmod g+s /extval/var/log/apt-cacher-ng

mkdir -p /extval/var/cache/apt-cacher-ng
chown apt-cacher-ng:apt-cacher-ng /extval/var/cache/apt-cacher-ng
chmod 755 /extval/var/cache/apt-cacher-ng
chmod g+s /extval/var/cache/apt-cacher-ng

# exec "$@"

/etc/init.d/apt-cacher-ng start && tail -f /extval/var/log/apt-cacher-ng/*
