# UOC-Tipologia-PRAC2

**Aleix Martínez** i **Ignasi Vilarasau**

## Context

La realització d'aquesta pràctica s'ha dut a terme en el context de l'assignatura _Tipologia i cicle de vida de les dades_ del Màster de _Data Science_ de la _Universitat Oberta de Catalunya (UOC)_.
En concret en aquesta pràctica ens hem centrat en les fases de preprocessament de les dades, anàlisi i visualització, mitjançant el llenguatge R. 

## Descripció

En aquest projecte treballarem sobre un conjunt de dades extret de _Kaggle_ que conté informació relativa a tots els llençaments fets en partits de la NBA al llarg de la temporada 2014-2015. L'objectiu de l'estudi és determinar els factors que influencien l'encert del llençament, com la distància a la canasta o el temps de jocs. La finalitat és coneixer en quines situacions tenim més probabilitats d'anotar coneixer les característiques del moment.

Enllaç: https://www.kaggle.com/dansbecker/nba-shot-logs

El dataset conté 128.060 observacions de 28 variables diferents, que les presentem a continuació:

  * **GAME_ID**: Identificador del partit
  * **MATCHUP**: Data del partit i noms dels equips local vs visitant
  * **LOCATION**: ¿Si es va jugar a casa o fora? A = away, H = home
  * **W**: Si l'equip local guanya o perd, W = win, L = lose
  * **FINAL_MARGIN**: Diferència de punts del resultat final.
  * **SHOT_NUMBER**: Quants llençaments portava el moment de fer l'acció.
  * **PERIOD**: Periode del partit en el que s'efectua el llençament.
  * **GAME_CLOCK**: Temps que queda per acabar al moment del tir.
  * **SHOT_CLOCK**: Segon de la posseció de la jugada (max 24 segons)
  * **DRIBBLES**: Dribblings fets pel jugador amb la pilota
  * **TOUCH_TIME**: Temps que el jugador ha tingut la pilota a les mans
  * **SHOT_DIST**: Distància desde la qual llença el jugador
  * **PTS_TYPE**: Tipo de llençament si de 2 o 3 punts (triple)
  * **SHOT_RESULT**: Si ha encertat (made) o fallat (missed) el llençament 
  * **CLOSEST_DEFENDER**: Nom del defensor més proper
  * **CLOSEST_DEFENDER_PLAYER_ID**: Id del defensor més proper
  * **CLOSE_DEF_DIST**: Distància amb el defensa més proper
  * **FGM**: Variable binària (0,1) indicant si ha encertat o falltat el tir
  * **PTS**: Punts aconseguits amb el llençament
  * **player_name**: Nom del jugador que efectua el tir
  * **player_id:** ID del jugador que efectua el tir

## Fitxers de codi utilitzat per realitzar el projecte:

* **Descripció:** 
* **Anàlisi:** 

## Bibliografia:

1. Calvo M., Subirats L., Pérez D. (2019). **_Introducción a la limpieza y análisis de los datos._**
Editorial UOC.
2. Megan Squire (2015). **_Clean Data._** Packt Publishing Ltd.
Tipologia i cicle de vida de les dades Pràctica 2 pàg 3
3. Jiawei Han, Micheine Kamber, Jian Pei (2012). **_Data mining: concepts and techniques._**
Morgan Kaufmann.
4. Jason W. Osborne (2010). **_Data Cleaning Basics: Best Practices in Dealing with Extreme Scores._** Newborn and Infant Nursing Reviews; 10 (1): pp. 1527-3369.
5. Peter Dalgaard (2008). **_Introductory statistics with R. Springer Science & Business Media._**
6. Wes McKinney (2012). **_Python for Data Analysis._** O’Reilley Media, Inc
