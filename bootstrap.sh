#!/usr/bin/env bash

# Setando variaveis
path="/vagrant/shell" 

echo '[Atualizando Ubuntu Server]'
apt-get update

echo '[Preparando ambiente]'
bash $path"/common.sh"

echo '[Instalando Apache]'
bash $path"/apache.sh"

echo '[Instalando PHP]'
bash $path"/php.sh"

echo '[Configurando VHOSTS]'
bash $path"/vhosts.sh"

echo '[Instalando MySQL]'
bash $path"/mysql.sh"

echo '[Restartando os servicos]'
bash $path"/restart.sh"
