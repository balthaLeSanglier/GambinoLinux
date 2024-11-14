#!/bin/bash

# Lire les missions sélectionnées depuis le fichier temporaire
if [ ! -f /tmp/selected_activities.txt ]; then
    echo "Erreur : Aucune mission sélectionnée. Veuillez exécuter le script principal d'abord."
    exit 1
fi

# Charger les missions sélectionnées dans un tableau
IFS=' ' read -r -a selected_missions < /tmp/selected_activities.txt

# Initialisation du compteur de missions réussies
missions_reussies=0

# Clé API Grok
GROK_API_KEY="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"

# Fonction pour générer des paroles via l'API Grok sans jq
generate_lyrics() {
    local prompt=$1
    response=$(curl https://api.groq.com/openai/v1/chat/completions -s \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $GROK_API_KEY" \
    -d "{
    \"model\": \"llama3-8b-8192\",
    \"messages\": [{
        \"role\": \"user\",
        \"content\": \"$prompt\"
    }]
    }")

    # Extraire les paroles de la réponse JSON
    lyrics=$(echo "$response" | grep -o '"content": *"[^"]*' | sed 's/"content": "//')

    # Nettoyer le texte en supprimant les éventuelles sections inutiles (comme les balises Markdown)
    formatted_lyrics=$(echo "$lyrics" | sed 's/\\n/\n/g' | sed 's/\*\*/ /g')

    # Afficher les paroles formatées
    echo -e "$formatted_lyrics"
}

echo "Vérification des missions de Gambino..."

for mission in "${selected_missions[@]}"; do
    case $mission in
        "fete")
            echo "Vérification de la mission : Faire la fête"
            if ! pgrep -f "sobriete_process" > /dev/null; then
                echo "Mission 'fête' complétée : aucun Processus de sobriété en cours."
                ((missions_reussies++))
            else
                echo "Mission 'fête' non complétée : processus sobriété en cours."
            fi
            ;;
        "alicante")
            echo "Vérification de la mission : Partir à Alicante"
            if [ -f "Alicante/gambino.txt" ]; then
                echo "Mission 'alicante' complétée : Fichier gambino.txt trouvé dans le dossier Alicante."
                ((missions_reussies++))
            else
                echo "Mission 'alicante' non complétée : Fichier gambino.txt manquant dans le dossier Alicante."
            fi
            ;;
        "ferrari")
            echo "Vérification de la mission : Rouler en voiture de location"
            if [ -d "garage" ] && [ "$(ls -A garage)" ]; then
                echo "Mission 'ferrari' complétée : Fichier de voiture trouvé dans le garage."
                ((missions_reussies++))
            else
                echo "Mission 'ferrari' non complétée : Aucun fichier de voiture trouvé dans le garage."
            fi
            ;;
        "quartier")
            echo "Vérification de la mission : Rouler dans le quartier"
            if [ -f "quartier1/gambino.txt" ] || [ -f "quartier2/gambino.txt" ] || [ -f "quartier3/gambino.txt" ]; then
                echo "Mission 'quartier' complétée : Fichier gambino.txt trouvé dans un des quartiers."
                ((missions_reussies++))
            else
                echo "Mission 'quartier' non complétée : Fichier gambino.txt manquant dans les quartiers."
            fi
            ;;
        "jul")
            echo "Vérification de la mission : Rencontrer JUL"
            if [ -f "rencontres/jul.txt" ]; then
                echo "Mission 'jul' complétée : Fichier jul.txt trouvé dans le dossier rencontres."
                ((missions_reussies++))
            else
                echo "Mission 'jul' non complétée : Fichier jul.txt manquant dans le dossier rencontres."
            fi
            ;;
        "foot")
            echo "Vérification de la mission : Partie de foot"
            if [ -d "foot" ] && [ "$(ls -A foot | grep -c 'joueur[1-4]\.txt')" -eq 4 ]; then
                echo "Mission 'foot' complétée : Tous les fichiers des joueurs sont présents dans le dossier foot."
                ((missions_reussies++))
            else
                echo "Mission 'foot' non complétée : Les fichiers de joueurs sont manquants dans le dossier foot."
            fi
            ;;
    esac
done

# Résumé des résultats
echo "Missions réussies : $missions_reussies / ${#selected_missions[@]}"

if [ "$missions_reussies" -eq "${#selected_missions[@]}" ]; then
    echo "Toutes les missions sélectionnées ont été complétées avec succès !"
    
    # Générer les paroles si toutes les missions sont réussies
    echo "Génération des paroles inspirées par les missions complétées..."
    prompt="Génère des paroles dans le style du rappeur marseillais Gambino. C'est un rappeur très festif. Le texte doit être en français. Tu peux faire des références aux différentes plages du monde, au foot, aux voitures, aux motos. Ne donne que les paroles, aucune explication quant à ton texte. Inspire toi des missions suivantes :"
    for mission in "${selected_missions[@]}"; do
        prompt+=" $mission,"
    done
    prompt="Paroles pour Gambino : $prompt Voici les paroles :"
    
    lyrics=$(generate_lyrics "$prompt")
    
    echo "Paroles générées :"
    echo "$lyrics"
else
    echo "Certaines missions n'ont pas été complétées. Veuillez vérifier et réessayer."
fi
