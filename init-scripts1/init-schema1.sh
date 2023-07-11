#!/bin/bash

mariadb -u root -plic4974 licensing < docker-entrypoint-initdb.d/schema1.sql

