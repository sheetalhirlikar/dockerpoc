#!/bin/bash

mariadb -u root -plic4974 pricebook < docker-entrypoint-initdb.d/pricebook_dump.sql

