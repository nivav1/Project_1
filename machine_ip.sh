#!/bin/bash

# machine_ip=$(terraform output -raw web_public_ip)

machine_ip=51.17.155.68

echo "$machine_ip ansible_user=admin"  > ./host.ini

echo $machine_ip
