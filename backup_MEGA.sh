#!/bin/bash
#
# Ricardo Vieira de Souza
#
# Data: 03/04/2019
# Versão 1.0
#
# Proposito de script e realizar um backup do diretorio /home/MEGA compactar 
# e mandar para o diretorio /home/servidor1/MEGA uma vez por semana ele esta no cron
#
#
##START
#
 TIME=`date +%Y_%m_%d___%H_%M_%S`         # Este comando irá adicionar a data no Nome do Arquivo de Backup.
 FILENAME=Backup_$TIME.tar.xz  # Aqui eu defino o formato do nome do arquivo de backup.
 SRCDIR=/home/MEGA            # Local Fonte     - onde estão os arquivos a serem feitos backup.
 DESDIR=/home/servidor1/MEGA             # Local Destino - onde o Backup será salvo.
 TIMEAPAGA=+6                 # Arquivos com mais de X dias serão apagados para uso com o comando find
 tar -Jcvf $DESDIR/$FILENAME $SRCDIR
 #END

#Apagando Arquivo mais Antigo a mais de $TIMEAPAGA dias
find $DESDIR f -mtime $TIMEAPAGA -exec rm -rf {} \;


