#!/bin/sh

nc -lkU /tmp/tor.sock &

exec tor -f /torrc
