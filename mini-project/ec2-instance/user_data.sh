#!/bin/bash

sudo apt update
sudo apt install -y nginx
echo ${aws_instance.ec2.public_ip} > /home/ubuntu/ip_ec2-projet.txt

