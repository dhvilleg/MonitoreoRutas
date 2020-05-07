# MonitoreoRutas
Script para monitoreo de enlaces de comunicaciones, 
Thread.sh -> script principal, crea una instancia de SondaEnlace.sh por cada dirección IP a monitorear
SondaEnlace.sh -> realiza ping a cada ip de la ruta y lo almacena en un archivo
ruta_enlace.dat -> listado de rutas a tracear
Colector.sh --> crea el reporte de eventos en CSV
