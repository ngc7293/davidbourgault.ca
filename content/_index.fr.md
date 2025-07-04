+++
title = "David Bourgault"
author = "David Bourgault <contact@davidbourgault.ca>"
+++

# David Bourgault

Salut! Je suis un développeur logiciel. De jour, je travaille sur des
algorithmes de routage et de compression de données chez
[Transit](https://transit.app/fr/). De nuit, je fais parfois d'autres choses.

- [Projets](#projets)
- [Contact](#contact)

## Projets

### Hixi

Historical Bixi = Hixi, un archiviste de données GBFS. Synchronise un flux
[GBFS](https://gbfs.org/) et compile la disponibilité des vélos et des points
d'ancrage dans une base de données temporelles. Le but à long terme est
d’accumuler suffisamment de données pour créer des modèles permettant de prédire
la disponibilité pour chaque station à un moment donné, pour améliorer la
sélection des stations de départ et d'arrivée lors d'une planification de
trajet.

Le projet inclus une interface web très simple qui permet de consulter la
disponibilité actuelle de chaque station, ainsi que leur historique des 24
dernières heure. J'opère se système pour mon service local (Bixi) sur
mtl.hixi.ca.

L'application dorsale est implémentée en Golang, mais le gros du travail est
fait par TimescaleDB et PostGIS. L'interface web est écrite en Svelte avec
Leaflet.

[Site web](https://mtl.hixi.ca) / [Github](https://github.com/ngc7293/hixi)

### qqr

Un générateur de code QR simple et sans arnaques. J'étais fatigué de voir des
codes QR "expirés" parce qu'ils avaient été générés sur des sites web qui
facturent chaque numérisation en forçant une redirection via leurs serveurs. Il
existe une multitude de bibliothèques et d'outils de génération de code QR,
mais, comme peu possèdent des interfaces web, ils sont souvent inaccessibles
aux gens moins technos.

QQR génère une image PNG noir sur blanc de haute résolution pour toute donnée
d'entrée textuelle. Aucune option de style. La page d'accueil du site offre une
boîte d'entrée textuelle, mais on peut aussi générer un code en accédant (`GET`)
à n'importe quel sous-chemin. Le service va encoder en QR tout le chemin suivant
le `/` initial. En théorie, il serait donc possible de l'utiliser dans un tag
`<img>`, mais prière de s'en abstenir.

Le serveur est écrit en Rust, et l'interface web est composée de quelques lignes
de HTML et JS pures _inlined_ dans le serveur.

[Site web](https://davidbourgault.ca/qr/) / [Github](https://github.com/ngc7293/qqr)

### Mappe

Un outil en ligne très simple, bâti pour m'aider à visualiser plusieurs ensembles
de données GeoJSON ou Polyline encodée côte à côte sur une même carte. Conçu
avec Svelte et Mapbox GL.

[Site web](https://davidbourgault.ca/map/) / [Github](https://github.com/ngc7293/mappe)
 
## Contact

 - [contact@davidbourgault.ca](mailto:contact@davidbourgault.ca)
 - [linkedin](https://linkedin.com/in/davidbourgault)
