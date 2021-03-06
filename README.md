# UOC-Tipologia-PRAC2

**Aleix Martínez** i **Ignasi Vilarasau**

## Context

La realització d'aquesta pràctica s'ha dut a terme en el context de l'assignatura _Tipologia i cicle de vida de les dades_ del Màster de _Data Science_ de la _Universitat Oberta de Catalunya (UOC)_.
En concret en aquesta pràctica ens hem centrat en les fases de preprocessament de les dades, anàlisi i visualització, mitjançant el llenguatge R. 

## Descripció

En aquest projecte treballarem sobre un conjunt de dades extret de _Kaggle_ que conté informació relativa a tots els llençaments fets en partits de la NBA al llarg de la temporada 2014-2015. L'objectiu de l'estudi és determinar els factors que influencien l'encert del llençament, com la distància a cistella o el temps de joc corregut fins a l'instant del llençament. La finalitat és coneixer en quines situacions tenim més probabilitats d'anotar coneixer les característiques del moment.

Enllaç: https://www.kaggle.com/dansbecker/nba-shot-logs

El dataset conté 128.060 observacions de 28 variables diferents, que les presentem a continuació:

  * **_GAME_ID_**: Identificador del partit
  * **_MATCHUP_**: Data del partit i noms dels equips local vs visitant
  * **_LOCATION_**: ¿Si es va jugar a casa o fora? A = away, H = home
  * **_W_**: Si l'equip local guanya o perd, W = win, L = lose
  * **_FINAL_MARGIN_**: Diferència de punts del resultat final.
  * **_SHOT_NUMBER_**: Quants llençaments portava el moment de fer l'acció.
  * **_PERIOD_**: Periode del partit en el que s'efectua el llençament.
  * **_GAME_CLOCK_**: Temps que queda per acabar al moment del tir.
  * **_SHOT_CLOCK_**: Segon de la posseció de la jugada (max 24 segons)
  * **_DRIBBLES_**: Dribblings fets pel jugador amb la pilota
  * **_TOUCH_TIME_**: Temps que el jugador ha tingut la pilota a les mans
  * **_SHOT_DIST_**: Distància desde la qual llença el jugador
  * **_PTS_TYPE_**: Tipo de llençament si de 2 o 3 punts (triple)
  * **_SHOT_RESULT_**: Si ha encertat (made) o fallat (missed) el llençament 
  * **_CLOSEST_DEFENDER_**: Nom del defensor més proper
  * **_CLOSEST_DEFENDER_PLAYER_ID_**: Id del defensor més proper
  * **_CLOSE_DEF_DIST_**: Distància amb el defensa més proper
  * **_FGM_**: Variable binària (0,1) indicant si ha encertat o falltat el tir
  * **_PTS_**: Punts aconseguits amb el llençament
  * **_player_name_**: Nom del jugador que efectua el tir
  * **_player_id_**: ID del jugador que efectua el tir

## Fitxers de codi utilitzat per realitzar el projecte:

* **Preparació:** En aquest primer script ens centrem en la fase de preprocessament de les dades. El que fem és assegurar la integració i selecció de les dades d’interès a analitzar posteriorment, mitjançant un procediment de neteja de les dades selectiu. Tractem les dades que contenen zeros, elements buits o valors inconsistents i identifiquem i tractem valors extrems.
* **Anàlisi:** En aquest segon script ens centrem en realitzar l'anàlisi de les dades prèviament seleccionades en l'script anterior. Començem seleccionant els grups de dades que es volen analitzar/comparar (planificació dels
anàlisis a aplicar). Aquests anàlisis es basen en la comprovació de la normalitat i homogeneïtat de la variància i aplicació de proves estadístiques per comparar la semblança o diferència dels grups de dades. A partir dels resultats obtinguts, mitjançant les diverses proves d'anàlisi, representem els resultats a partir de taules i gràfiques.
Finalment acabem concloent en l'apartat de conclusions on parlem sobre si els resultats ens ajuden o no a respondre al problema inicialment plantejat i comentaris relacionats.
* **PRAC2_Aleix_Ignasi:** Aquest document incorpora les parts de *Preaparació* i *Anàlisi* en un únic document.

## Llicència del dataset:

Per poder emmagatzemar el dataset hem hagut de tenir en compte quina mena de llicència era la més apropiada pel nostre dataset.
Tenint en compte que el nostre dataset ha estat extret a partir d’una pàgina web pública i els atributs que hem acabat extreient eren d’abast públic. En aquest sentit hem optat per la llicència **_Released Under CC BY-SA 4.0 License_**, ja que com hem comentat, partim d’unes dades obtingudes en una web púbilca i que estan a l’abast de qualsevol persona. Per tant permetem que es facin adaptacions del nostre dataset final i permetem que se’n facin usos comercials.

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
