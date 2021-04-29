# R_code_multivariate_analysis.r

#compatta i dati
#componente principale 1 (range dei dati è il 90%)e la componente principale 2 (range è del 10%) è perpendicolare alla principale 1
# analisi multivariata uso solo la PC1 perchè contiene il 90% dei dati

setwd("C:/lab/")
library(raster)
library(RStoolbox)
logan <- brick("p224r63_2011_masked.grd")

plot(logan$B1_sre, logan$B2_sre, col="red", pch=19, cex=2) #pch=simboli
pairs(logan) #mette in correlazione le variabili a due a due, le variabili sono le nostre bande(0.93=correlatissime) indice di Chrinson. Quanto queste bande sono molto correlate
# sistema di sette bande che 
#(benedettissima analisi multivariata), fare a step perchè immagine è enorme
# Ricampionamento 
loganres <- aggregate(logan, fact=10) #immagine con risoluzione 300x300
par(mfrow=c(2,1))
plotRGB(logan, 4, 3, 2, stretch="Lin")
plotRGB(loganres, 4, 3, 2, stretch="Lin")

#PCA (Principal Component Analysis for rasters)
#compattiamo l'immagine in un minor numero di bande in una sola, riducendo le due dimensioni a una sola e facciamo la PC1 (90% della varianza) 
#con la funzione  rasterPCA
logan_pca <- rasterPCA(loganres) #contiene all'interno la mappa, il modello, ecc
# con la funzione summary: creiamo il sommario del nostro modello
summary(logan_pca$model)
#Importance of components:
#                          Comp.1      Comp.2       Comp.3       Comp.4
#Standard deviation     1.2050671 0.046154880 0.0151509526 4.575220e-03
#Proportion of Variance 0.9983595 0.001464535 0.0001578136 1.439092e-05
#Cumulative Proportion  0.9983595 0.999824022 0.9999818357 9.999962e-01
 #                            Comp.5       Comp.6       Comp.7
#Standard deviation     1.841357e-03 1.233375e-03 7.595368e-04
#Proportion of Variance 2.330990e-06 1.045814e-06 3.966086e-07
#Cumulative Proportion  9.999986e-01 9.999996e-01 1.000000e+00

# solo con la prima componente, si spiega il 90%della varianza, la seconda aggiunge pochissimo 
#con le prime tre bande spiego il 99,99 
plot(logan_pca$map) #vediamo il grafico, per la PC1 c'è tutta l'informazione e nell'ultima c'è solo rumore

plotRGB(logan_pca$map, 1, 2, 3, stretch="Lin") # montiamo le 3 bande principali
