#!/bin/bash

# general tools to see if software is installed
case "$OSTYPE" in
solaris*) echo "SOLARIS" ;;
darwin*) echo "OSX" ;;
linux*) echo "LINUX" ;;
bsd*) echo "BSD" ;;
msys*) echo "WINDOWS" ;;
cygwin*) echo "ALSO WINDOWS" ;;
*) echo "unknown: $OSTYPE" ;;
esac
