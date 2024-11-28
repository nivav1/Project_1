#!/bin/bash


apt update -y

apt install pipx -y

pipx ensurepath

pipx install ansible-core

pipx ensurepath
