#!/bin/bash

set -xe

CC=gcc
CFLAGS="-Wall -Wextra -g"

$CC $CFLAGS ../src/main.c -o ../target/main
