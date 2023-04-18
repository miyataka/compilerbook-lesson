#!/bin/bash

# start ec2

SSH_CMD="ssh personal_ubuntu"

$SSH_CMD 'bash -c "sudo apt update && sudo apt install -y gcc make git binutils libc6-dev"'

$SSH_CMD 'bash -c "mkdir -p ./wspace"'
$SSH_CMD 'bash -c "cd wspace && git clone https://github.com/rui314/chibicc.git || git pull"'
$SSH_CMD 'bash -c "cd wspace && git clone https://github.com/miyataka/compilerbook-lesson.git || git pull"'
$SSH_CMD

# stop ec2
