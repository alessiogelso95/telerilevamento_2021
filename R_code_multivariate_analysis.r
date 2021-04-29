# R_code_multivariate_analysis.r

#compatta i dati
#componente principale 1 (range dei dati è il 90%)e la componente principale 2 (range è del 10%) è perpendicolare alla principale 1
# analisi multivariata uso solo la PC1 perchè contiene il 90% dei dati

setwd("C:/lab/)
library(raster)
library(RStoolbox)
logan <- brick("p224r63_2011_masked.grd")

plot(logan$B1_sre, logan$B2_sre, col="red", pch=19, cex=2) #pch=simboli
pairs(p224r63_2011) #mette in correlazione le variabili a due a due, le variabili sono le nostre bande(0.93=correlatissime) indice di Chrinson. Quanto queste bande sono molto correlate
# sistema di sette bande che 
#(benedettissima analisi multivariata), fare a step perchè immagine è enorme
# Ricampionamento 
loganres <- aggregate(logan, fact=10) #immagine con risoluzione 300x300
