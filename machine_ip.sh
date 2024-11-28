#!/bin/bash

machine_ip=$(terraform output -raw web_public_ip)

echo "$machine_ip ansible_user=admin"  > ./ansible/host.ini

echo $machine_ip
