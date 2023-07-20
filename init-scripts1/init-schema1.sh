#!/bin/bash

#apt-get update
#apt-get install libdbi-perl
#apt-get install libdbd-mysql-perl


mariadb -u root -plic4974 licensing < docker-entrypoint-initdb.d/licensing_dump.sql

