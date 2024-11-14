#!/bin/bash

# Liste des missions possibles
activites=("fete" "alicante" "ferrari" "quartier" "jul" "foot")

# Générer un scénario aléatoire avec 3 missions différentes
selected_activites=()
while [ "${#selected_activites[@]}" -lt 3 ]; do
    activity=${activites[$RANDOM % ${#activites[@]}]}
    # Ajouter la mission uniquement si elle n'est pas déjà sélectionnée
    if [[ ! " ${selected_activites[@]} " =~ " ${activity} " ]]; then
        selected_activites+=("$activity")
    fi
done

echo "${selected_activites[*]}" > /tmp/selected_activities.txt

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
            echo "Lancement du processus de sobriété... Pour faire la fête, il faut le supprimer"
            exec -a "sobriete_process" sleep 1000 &  # Simuler un processus de sobriété
            echo "Processus de sobriété lancé avec l'ID : $!"
            echo ""
            ;;
            
        "alicante")
            echo "Mission : Partir à Alicante"
	    echo "Déplacez gambino.txt dans un dossier Alicante"
            touch gambino.txt
            echo ""
            ;;
            
        "ferrari")
            echo "Mission : Rouler en voiture de location"
            # Créer un fichier pour représenter la Ferrari de Gambino
            mkdir garage
            random_car=$(shuf -n 1 catalogue.txt)
            echo "Gambino doit louer une ${random_car}. Créer le fichier ${random_car}.txt et ajouter là à son garage"
            echo ""
            ;;
            
        "quartier")
            echo "Mission : Rouler dans le quartier"
            # Simuler les déplacements dans le quartier
            mkdir quartier1 quartier2 quartier3
            touch gambino.txt
            echo "Gambino dois traverser les quartier 1,2 et 3"
            echo "Copier le fichier à travers les dossiers 'quartier'"
            echo ""
            ;;
            
        "jul")
            echo "Mission : Rencontrer JUL"
            echo "Déplacez le fichier jul.txt dans le répertoire rencontres. Vous le retrouverez dans le dossier personnalitées"
            echo "Supprimez le dossier rencontre une fois l'opération effectué : le J c'est le S(eul qui compte)"
            # Créer un fichier pour la rencontre avec JUL
            mkdir rencontres
            mkdir personalitees
            touch personalitees/jul.txt
            touch personalitees/sch.txt
            touch personalitees/naps.txt
            touch personalitees/koba_la_d.txt
            touch personalitees/soso_maness.txt
            echo ""
            ;;
            
        "foot")
            echo "Mission : Partie de foot"
            # Créer les fichiers des joueurs pour la partie de foot
            mkdir foot
            touch joueur1.txt
            touch joueur2.txt
            touch joueur3.txt
            touch joueur4.txt
            echo "Ajouter l'ensembles des joueurs dans le dossier foot"
            ;;
    esac
done

echo "Toutes les missions ont été préparées ! Vous pouvez maintenant vérifier si elles ont été complétées."
echo "Une fois que vous avez terminé, lancez le script 'verifier_mission.sh' pour vérifier si vous avez réussi les missions."

