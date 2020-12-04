#!/bin/bash

launch i3viswiz -i docker_server -f
launch i3fyra -m D
launch sleep 1
launch sudo docker-compose up
