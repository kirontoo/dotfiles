#!/bin/bash

launch sleep 1
launch i3viswiz -i test_runner -f
launch i3fyra -m D
launch npm test --watch
