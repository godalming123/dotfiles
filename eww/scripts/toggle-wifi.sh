#!/bin/bash

connection=$(nmcli networking connectivity)

if [ "$connection" = "none" ]; then
  nmcli networking on
else
  nmcli networking off
fi