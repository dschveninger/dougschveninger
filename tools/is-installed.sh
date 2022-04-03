
#!/bin/bash

# general tools to see if software is installed
if [[ $(which "$1") && $("$1" --version) ]]; then
    echo "$1 installed"
  else
    echo "$1 not installed"
    echo "$2"
fi
