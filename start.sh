#!/bin/bash

SCREEN="ServiceName"
SERVICE="server.jar"
INITMEM="1G"
MAXMEM="8G"

if [ "$#" -eq 1 ]; then
        if [ "$1" == "inscreen" ]; then
                # Wird ausgefuehrt, wenn der Parameter "inscreen" ist.
                while true
                do
                        java -Xms$INITMEM -Xmx$MAXMEM -jar $SERVICE
                        echo "Zum Abbrechen des Neustarts bitte Strg+C druecken!"
                        echo "Neustart in:"
                        for i in 3 2 1
                        do
                                echo "$i..."
                                sleep 1
                        done
                        echo "-- Starte Server neu --"
                done
        fi
else
        screen -S $SCREEN bash $0 inscreen
fi
