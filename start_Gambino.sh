#!/bin/bash

# Liste des missions possibles
activites=("fete" "alicante" "ferrari" "quartier" "jules" "foot")

# Générer un scénario aléatoire avec 3 missions différentes
selected_activites=()
for i in {1..3}; do
    activity=${activites[$RANDOM % ${#activites[@]}]}
    selected_activites+=("$activity")
done

# Afficher les missions à accomplir
echo "Gambino doit accomplir les missions suivantes pour réussir son album :"
echo "${selected_activites[*]}"
echo "Voici ce que vous devez faire pour chaque mission :"

# Préparer les fichiers et les processus nécessaires pour chaque mission
for activity in "${selected_activites[@]}"; do
    case $activity in
        "fete")
            echo "Mission : Faire la fête"
            # Lancer le processus de sobriété (un simple processus sleep pour simuler)
            echo "Lancement du processus de sobriété..."
            sleep 1000 &  # Simuler un processus de sobriété
            echo "Processus de sobriété lancé avec l'ID : $!"
            ;;
        "alicante")
            echo "Mission : Partir à Alicante"
	    echo "Déplacez gambino.txt dans un dossier Alicante"
            touch gambino.txt
            ;;
        "ferrari")
            echo "Mission : Rouler en voiture de location"
            # Créer un fichier pour représenter la Ferrari de Gambino
            mkdir garage
            random_car=$(shuf -n 1 catalogue.txt)
            echo "Gambino doit louer une ${random_car}. Créer le fichier ${random_car}.txt et ajouter là à son garage"
            ;;
        "quartier")
            echo "Mission : Rouler dans le quartier"
            # Simuler les déplacements dans le quartier
            mkdir quartier1 quartier2 quartier3
            touch gambino.txt
            echo "Gambino a traversé les quartiers (fichier déplacé à travers les dossiers)."
            ;;
        "jules")
            echo "Mission : Rencontrer JUL"
            echo "Déplacé le fichier jul.txt dans le répertoire rencontres"
            # Créer un fichier pour la rencontre avec JUL
            mkdir rencontres
            touch jul.txt

            ;;
        "foot")
            echo "Mission : Partie de foot"
            # Créer les fichiers des joueurs pour la partie de foot
            mkdir foot
            touch joueur1.txt
            touch joueur2.txt
            touch joueur3.txt
            touch joueur4.txt
            echo "Les joueurs ont été ajoutés pour la partie de foot (fichiers créés)."
            ;;
    esac
done

echo "Toutes les missions ont été préparées ! Vous pouvez maintenant vérifier si elles ont été complétées."
echo "Une fois que vous avez terminé, lancez le script 'verifier_mission.sh' pour vérifier si vous avez réussi les missions."

