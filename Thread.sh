#!/bin/bash
#
#  Script %name:        Thread.sh %
#  %version:            1 %
#  Description:         Script para Simular hilos en script de bash, para Monitoreo
#  %created_by:         Diego Villegas (FDM) %
#  %date_created:       2013-12-10 17:45:32
# =====================================================================================
# change log
# =====================================================================================
# Mod.ID         Who                       When                         Description
# =====================================================================================
#
# =====================================================================================
# Usage:				Lee archivo de configuracion ruta_enlace.dat y llama a 
#						SondaEnlace.sh para simular hilos enviando a backgroud
#						procesos bash
# =====================================================================================
HOME="/home/net"
for i in `cat $HOME/ruta_enlace.dat`
do
	ROUTER_NAME=`echo $i | awk -F: '{ print $1 }'`
	TARGET=`echo $i | awk -F: '{ print $2 }'`
	nohup $HOME/SondaEnlace.sh $TARGET $ROUTER_NAME &
done