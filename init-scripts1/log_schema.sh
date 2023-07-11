#!/bin/bash

mariadb -u root -plic4974 log < docker-entrypoint-initdb.d/log_dump.sql

