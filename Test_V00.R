---
title: "PAC3 - Estadística avançada"
author: "Aleix Martínez Bages & Ignasi Vilarasau Antolín"
date: '`25/04/2019`'
output:
  html_document:
    toc: TRUE
  pdata_document:
    toc: TRUE
---

###1) Descripció del dataset. Perquè és important i quina pregunta/problema pretén respondre?
###2) Integració i selecció de les dades d’interès a analitzar.
###3) Neteja de les dades.
###3.1) Les dades contenen zeros o elements buits? Com gestionaries aquests casos?
###3.2) Identificació i tractament de valors extrems.
###4) Anàlisi de les dades.
###4.1) Selecció dels grups de dades que es volen analitzar/comparar (planificació dels anàlisis a aplicar).
###4.2) Comprovació de la normalitat i homogeneïtat de la variància.
###4.3) Aplicació de proves estadístiques per comparar els grups de dades. En funció de les dades i de l’objectiu de l’estudi, aplicar proves de contrast d’hipòtesis, correlacions, regressions, etc. Aplicar almenys tres mètodes d’anàlisi diferents.
###5) Representació dels resultats a partir de taules i gràfiques.
###6) Resolució del problema. A partir dels resultats obtinguts, quines són les conclusions? Els resultats permeten respondre al problema?
###7) Codi: Cal adjuntar el codi, preferiblement en R, amb el que s’ha realitzat la neteja, anàlisi i representació de les dades. Si ho preferiu, també podeu treballar en Python. 

### 0) Carreguem el fitxer de dades:

Començarem per carregar el fitxer de dades ja preprocessat per l'anàlisi:
```{r}
data <- read.csv("shot_logs.csv", sep = ',', encoding = 'utf-8', header = TRUE, 
                    strip.white = TRUE)
```
Intentarem visualitzar una mica el set de dades carregat.
Començarem per comprovar si ja no existeixen valors N/A i el tipus de variables definidesper defecte per a cada atribut:
```{r} 
"N/A values:"
colSums(is.na(data))
"Summary:"
summary(data)
```
Valors N/A únicament a l'atribut "SHOT_CLOCK".
### https://watch.nba.com/

# Data shot clock en funció del game clock i creem dues variables noves de 

```{r}
strip_GAME_CLOCK <- strptime(data$GAME_CLOCK, '%M:%S') 

data$GAME_CLOCK_MIN <- strip_GAME_CLOCK$min
data$GAME_CLOCK_SEC <- strip_GAME_CLOCK$sec

data$GAME_CLOCK_MIN <- as.numeric(data$GAME_CLOCK_MIN)
data$GAME_CLOCK_SEC <- as.numeric(data$GAME_CLOCK_SEC)

data[is.na(data$SHOT_CLOCK) & data$GAME_CLOCK_SEC < 24,]

```

```{r}
data$SHOT_CLOCK <- ifelse(is.na(data$SHOT_CLOCK), data$GAME_CLOCK,data$SHOT_CLOCK)
colSums(is.na(data))
```

#SHOT_CLOCK > 24s (1205 ítems):
#Així aconseguim netejar l'atribut SHOT_CLOCK:

```{r}
data$SHOT_CLOCK[data$SHOT_CLOCK > 24] <- 24
```

#Neteja TOUC_TIME <0:

# Mirar quins són els valors que marxen més de 3 sigmas i els eliminem, sino, els reincorporem amb valor absolut.

```{r}
data$TOUCH_TIME <- abs(data$TOUCH_TIME)
df_nba <-data[data$TOUCH_TIME <= 25,]
```

# Realitzarem un estudi sobre les distribucions de les mostres en funció de si és part del partit o és part de la pròrroga. Estudiarem la presició, efectivitat dels tirs i acabarem concluint si és molt diferent o no a la observada entre les mostres de poblacions de PERIOD > 4, o PERIOD < 4:
# Estudiarem el comportament dels períodes.
# TEST NO PARAMÈTRIC/TESTS PARAMÈTRICS:
# Començarem però estudiant les variables TA, TI, TF per OT i RT. 
# Un cop ho tinguem, categoritzarem les variables distància i distància defensor i crearem l'atribut clutch!


#La distància està en unitats de peus i per tant la factorització serà en funció de si la distància en peus es correspon a una distància dins de l'ampolla, fora de l'ampolla, però dins de la línia de 3 o fora de la línia de 3:
```{r}
#Nova variable SHOT_DIST categòrica:
#Agafem distàncies reals d'una pista de bàsquet:
df_nba$DIST_TIR[df_nba$SHOT_DIST <= 8] <- "A"
df_nba$DIST_TIR[df_nba$SHOT_DIST > 8 & df_nba$SHOT_DIST <= 22] <- "B"
df_nba$DIST_TIR[df_nba$SHOT_DIST > 22] <- "C"

#Nova variable DIST_DEF categòrica:
#2.3 és el valor del primer quartil:
df_nba$DIST_DEF[df_nba$CLOSE_DEF_DIST <= 2.3] <- "REALLY CLOSE"
df_nba$DIST_DEF[df_nba$CLOSE_DEF_DIST > 2.3 & df_nba$CLOSE_DEF_DIST < mean(df_nba$CLOSE_DEF_DIST)]<- "CLOSE"
df_nba$DIST_DEF[df_nba$CLOSE_DEF_DIST > mean(df_nba$CLOSE_DEF_DIST)] <- "FAR"
df_nba$DIST_DEF <- as.factor(df_nba$DIST_DEF)
df_nba$DIST_TIR <- as.factor(df_nba$DIST_TIR)

#Variable clutch/handicap:
#Les variables que poden influir seran: GAME_CLOCK, FINAL_MARGIN<< relacionat amb PERIOD>=4 i GAME_CLOCK petit.
df_nba$clutch <- ifelse(as.integer(df_nba$PERIOD) >= 4 & df_nba$GAME_CLOCK_MIN = 0  & (df_nba$FINAL_MARGIN < 6 & df_nba$FINAL_MARGIN > -6),1,0)

#Variable coinfiança? (La podríem mirar de posar)
#Si el jugador està en ratxa de tirs anotats.


# Punts de cada jugador durant la temporada:
df_nba %>% group_by(player_name) %>% summarise(PTS=sum(FGM*PTS_TYPE))
```

```{r}
df_OT <-data[data$PERIOD > 4,]
df_RT <-data[data$PERIOD < 4,]
```

```{r}
library(dplyr)
summarise(group_by(df_OT, player_name), PTS=sum(PTS))
summarise(group_by(df_RT, player_name), PTS=sum(PTS))
# pipe operator:
df_nba %>% group_by(player_name, PTS_TYPE, FGM) %>% count(FGM)
                                                                      
df_SHOT_OT <- df_OT %>% group_by(player_name, PTS_TYPE, FGM) %>% count(FGM)
df_SHOT_RT <- df_OT %>% group_by(player_name, PTS_TYPE, FGM) %>% count(FGM)

# Crear variables TI, TR, TF per els dos dataframes nous.
```











