#!/bin/bash

# Arrêter le processus de sobriété si lancé
pkill -f "sleep 1000"

# Supprimer les dossiers créés par les missions, ainsi que leur contenu
rm -rf Alicante garage quartier1 quartier2 quartier3 rencontres foot

# Supprimer les fichiers créés par les missions
rm -f gambino.txt
rm -f /tmp/selected_activities.txt
rm -f jul.txt
rm -f joueur*.txt

# Afficher un message de confirmation
echo "Le dossier a été réinitialisé à son état initial. Seuls start_gambino.sh, verif_gambino.sh et catalogue.txt ont été conservés."
