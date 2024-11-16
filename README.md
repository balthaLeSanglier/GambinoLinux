# GambinoLinux: Un Jeu Inspiré de Gambino

**GambinoLinux** est un jeu amusant et éducatif basé sur des scripts Bash. Le joueur aide Gambino (célèbre chanteur marseillais) à compléter des missions pour l'aider à réussir son album. Chaque mission correspond à des tâches à accomplir dans un environnement Linux simulé. Le jeu met en avant la logique de script et les commandes Linux.

---

## Structure du Projet

- **`start_gambino.sh`** : Script principal pour générer les missions aléatoires et préparer les tâches.
- **`verif_gambino.sh`** : Script pour vérifier si les missions ont été correctement réalisées. Génère des paroles basées sur les missions complétées.
- **`reset.sh`** : Script pour remettre l'environnement du jeu à zéro.
- **`catalogue.txt`** : Fichier contenant une liste de voitures utilisées pour la mission "Ferrari".
- **Dossiers et fichiers créés dynamiquement** : Divers fichiers et dossiers (ex. `garage`, `quartier1`, `rencontres`) sont générés en fonction des missions.

---

## Installation
Clonez le dépôt dans votre répertoire local :
```bash
git clone https://github.com/balthaLeSanglier/GambinoLinux.git
cd GambinoLinux
```

## Comment gagner ?
Dans cette étape, nous allons voir la résolution des 6 missions :
  - **`Fête`**: Pour résoudre cette mission, nous devons supprimer le processus sobriété. Pour trouver le PID du processus, nous devons faire un `ps -aux | sobriete`, puis utiliser la commande `kill`.
  - **`Alicante`**: Il faut faire voyager Gambino en copiant gambino.txt dans un dossier Alicante. Pour créer ce dossier, on utilise `mkdir Alicante`, puis pour copier le fichier, on fait `cp gambino.txt Alicante`.
  - **`Ferarri`**: Pour résoudre ferrari, on doit créer le fichier *voiture*.txt (selon ce qui est indiqué par la console) avec `touch voiture.txt` puis copier le fichier avec `cp voiture.txt garage`.
  - **`Quartier`**: Gambino veut conduire dans tous les quartiers de la ville. Pour cela, il faut faire ces commandes : `cp gambino.txt quartier1`, `cp gambino.txt quartier2` et `cp gambino.txt quartier3`.
  - **`JUL`**: Un feat avec JUL est prévu ! Il faut donc aller chercher le fichier JUL dans personalitees et le copier dans rencontres `cp personalitees/jul.txt recontres`.
  - **`Foot`**: C'est parti pour un five ! La résolution se fait en copiant les 4 joueurs dans le dossier foot : `cp joueur1.txt foot`, `cp joueur2.txt foot`, `cp joueur3.txt foot`, `cp joueur4.txt foot`

3 de ces missions seront choisi aléatoirement à chaque lancement. A tout moment, vous pouvez choisir de lancer ./verification_gambino.sh pour voir votre avancement dans les missions. Une fois les 3 missions accomplies et le script verification_gambino.sh, valide votre réussite et génère en prime des paroles de chanson dans le style de Gambino inspiré par les missions accomplies.
