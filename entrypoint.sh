#!/bin/bash

service aria2 start
service chrome-remote-desktop start
jupyter lab --ip=0.0.0.0 --port=$PORT --ServerApp.token='' --ServerApp.password='' --allow-root
