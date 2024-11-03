#!/bin/bash

machine_ip=$(terraform output -raw web_public_ip)

echo $machine_ip  >> ./host.ini
