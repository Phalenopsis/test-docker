# Workshop : Docker & (Spring + MySQL)

## Objectif
Créer une API c'est bien, mais qu'elle soit connectée à une base de données, c'est mieux !
Ton objectif ici est de dockeriser (oui, ce terme existe vraiment 😎) ton application spring avec MySQL.
Pour cela :
1. Tu vas créer un build de MySQL depuis une image existante
2. Tu vas créer un build de ton application Spring depuis ta propre image à l'aide d'un Dockerfile
3. Tu vas relier les deux

## Ok mais y'a anguille sous roche
Tu pourrais tout à fait faire ça avec ce que tu as vu jusqu'à maintenant :
- Lancer le container MySQL
- Lancer le container Spring

Mais il faut :
- Lancer MySQL avec `docker run`, et créer la base de données, un user et un mot de passe MySQL en variable d'environnement par le terminal
- Lancer ton app Spring via son Dockerfile avec `docker run` puis la connecter à MySQL
- Gérer le réseau (network) entre les deux

👉 Ça se fait, mais il la douceur de la vie tient parfois de la simplicité lorsqu'elle s'offre à nous : j'ai nommé `le docker-compose.yml`

## Docker compose
Docker Compose est un outil qui te permet de décrire, configurer et lancer plusieurs conteneurs Docker en même temps, à partir d’un fichier unique : le `docker-compose.yml`.

Tu vas orchestrer plusieurs services comme un seul système (Spring & MySQL ici dans notre cas, mais tu pourrais ajouter Flyway, Redis...)

Au lieu de faire 3 ou 4 `docker run`, tu décris tout ton environnement dans ton fichier YAML, puis tu lances simplement la commande :

```bash
docker compose up
```

Tout démarre alors, selon ce que tu as décris, sur les bons ports, les bonnes variables, les bons volumes, etc...

👉 Tu vas donc devoir configurer le fichier `docker-compose.yml` afin de lancer les conteneurs MySQL et ton app Spring d'un seul coup !
Le fichier est déjà créé, va y faire un tour 😉

## Y'aura peut-être à un moment un problème
 "Lorsque le feu est rouge je peux passer la première, mais c'est parce qu'il est vert que je peux avancer"