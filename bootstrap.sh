#!/usr/bin/env bash

# Setando variaveis
DIR="/vagrant/shell" 
DIR_SERVICES=$DIR"/services"
DIR_CMD=$DIR"/cmd"

echo '[Atualizando Ubuntu Server]'
apt-get update

echo '[Preparando ambiente]'
bash $DIR_SERVICES"/common.sh"

echo '[Instalando Apache]'
bash $DIR_SERVICES"/apache.sh"

echo '[Instalando PHP]'
bash $DIR_SERVICES"/php.sh"

echo '[Configurando VHOSTS]'
bash $DIR_CMD"/addhost.sh" fuelphp.test

echo '[Instalando MySQL]'
bash $DIR_SERVICES"/mysql.sh" $DIR_SERVICES

echo '[Restartando os servicos]'
bash $DIR_SERVICES"/restart.sh"
