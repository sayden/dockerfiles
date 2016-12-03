#!/bin/bash
sudo docker run -it -u $USER -v `pwd`/gopath:/go -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --name=idea-go sayden/idea-ce-go:2016-3
