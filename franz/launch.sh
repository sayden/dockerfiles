#!/bin/bash
docker run -it --name=sayden-franz -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY sayden/franz:4.0.4
