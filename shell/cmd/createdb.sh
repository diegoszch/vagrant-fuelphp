#!/usr/bin/env bash

DB=${1} 

mysql -uroot -proot -e "create database $DB"