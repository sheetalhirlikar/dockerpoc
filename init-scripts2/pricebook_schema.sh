#!/bin/bash

#apt-get update
#apt-get install libdbi-perl
#apt-get install libdbd-mysql-perl

mariadb -u root -plic4974 pricebook < docker-entrypoint-initdb.d/pricebook_dump.sql

