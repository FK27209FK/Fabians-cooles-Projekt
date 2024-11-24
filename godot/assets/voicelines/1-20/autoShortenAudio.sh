#!/bin/bash

for importFile in *.import; do
    rm importFile
    echo "removed: ${importFile}"
done

# Alle WAV-Dateien in einem Ordner verarbeiten
for file in *.wav; do
    # Ausgabe-Dateiname generieren
    temp="tmp_${file}"

    echo "Bearbeite Datei: $file -> $temp"

    # Stille am Anfang automatisch entfernen (Standard-Schwellenwert -30 dB, 0.5s minimale Stille)
    ffmpeg -i "$file" -af "silenceremove=start_periods=1:start_threshold=-70dB:start_duration=0.1" "$temp"
    rm $file
    mv $temp $file
    echo "Fertig mit $file"
done

echo "Alle Dateien wurden verarbeitet."