#!/bin/bash
#
#  Script %name:        SondaEnlace.sh %
#  %version:            1 %
#  Description:         Script para monitoreo de enlace
#  %created_by:         Diego Villegas (FDM) %
#  %date_created:       2013-12-10 17:45:32
# =====================================================================================
# change log
# =====================================================================================
# Mod.ID         Who                       When                         Description
# =====================================================================================
#
# =====================================================================================
# Usage:				Recibe parametro $1 y la escribe en $TARGET
#						lee la parametro $2 y la escribe en nombre de log
# =====================================================================================

TARGET="$1"
LOG="/home/net/$2.log"
# ping 3 packetes cada 1 seconds, espera de 3 seconds maximum
while(true)
do
PING=$(ping -n -c 3 -i 1 -W 3 $TARGET 2>&1)
	if [[ $? != 0 ]]
	then
			if [[ $PING =~ "loss" ]]
			then
					# no reply
					ERROR=$(echo "$PING" | grep 'loss')
			else
					# destination unreachable
					ERROR=$PING
			fi
		echo "$2;$(date +%F\ %T);$ERROR" &>> $LOG
	fi
#sleep 10
done