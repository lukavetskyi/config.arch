#!/bin/bash

case "$1" in 
  "prev")
    playerctl previous
    ;;
  "toggle")
    playerctl play-pause
    ;;
  "next")
    playerctl next
    ;;
esac
