#!/bin/bash

# Schleife durch alle .m4a Dateien im aktuellen Ordner
for file in *.m4a; do
    # Hole den Dateinamen ohne die .m4a-Erweiterung
    base="${file%.m4a}"
    
    # Konvertiere die Datei in .wav
    ffmpeg -i "$file" "$base.wav"
    
    # Wenn die Konvertierung erfolgreich war, lösche die .m4a Datei
    if [ $? -eq 0 ]; then
        rm "$file"
    else
        echo "Fehler beim Konvertieren von $file"
    fi
done
