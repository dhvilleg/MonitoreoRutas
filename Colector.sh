#!/bin/bash
#
#  Script %name:        Colector.sh %
#  %version:            1 %
#  Description:         Script para colectar informes de SondaEnlace.sh
#  %created_by:         Diego Villegas (FDM) %
#  %date_created:       2013-12-10 17:45:32
# =====================================================================================
# change log
# =====================================================================================
# Mod.ID         Who                       When                         Description
# =====================================================================================
#
# =====================================================================================
# Usage:                Lee archivo de configuracion ruta_enlace.dat,lee logs de estos
#                       procesos y los presenta en formato CSV para exportar a excel
#                       proceso bash se ejecuta al inicio de jornada
#						crontab -e ---> 0 9 * * * sh /home/net/Colector.sh
# =====================================================================================
HOME="/home/net"
REPORT="repoteEventos.csv"
FECHA=`date +%m/%d/%y`
#Lista de correos a distribuir, separado por comas
LIST='v.villegastocache@fdm.com'
#encera archivo de eventos
>$HOME/$REPORT
#headers
echo ";Reporte diario de eventos en nodos de enlace DCP-DCA;">>$HOME/$REPORT
echo "Fecha;$FECHA;"
echo ";;">>$HOME/$REPORT
echo "router-iface;Event Date;Event Detail">>$HOME/$REPORT

for i in `cat $HOME/ruta_enlace.dat`
do
        ROUTER_NAME=`echo $i | awk -F: '{ print $1 }'`
        if [ -f $HOME/$ROUTER_NAME.log ]; then
                cat $HOME/$ROUTER_NAME.log>>$HOME/$REPORT
                >$HOME/$ROUTER_NAME.log
        else
                echo "$ROUTER_NAME;;no se ha encontrado errores">>$HOME/$REPORT
        fi
done
#No configurado SMTP ni relay
#uuencode $HOME/$REPORT |mail -s "Reporte de hallazgos monitoreo red de replica" $LIST
#Mata el proceso de monitoreo
kill $(pgrep Sonda)