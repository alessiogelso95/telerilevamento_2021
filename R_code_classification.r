# R_code_classification.r
# setwd("C:/lab/Solar_orbiter")

# richiamo il pacchetto raster
library(raster)
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

#plot per vedere gli RGB montati
plotRGB(so, 1, 2, 3, stretch="Lin")

#richiamare
library(RStoolbox)

# classificazione di immagine vuole dire che ogni pixel ha determinati valori (assumere i livelli come assi cartesiani). 
# Il programma va a prendere il valore in un pixel e va a vedere i valori di riflettanza nei vari assi e li congiunge, così per alcuni pixel, e crea nuovle di punti in base alle classi che si definiscono
#tutti gli altri pixel vengono classificati in funzione di questo training-set, valutanto la distanza dei valori dalla nuvola (metodo della massima verosimiglianza)
# Noi possiamo solo definire il numero di classi
#UNSUPERVISED CLASSIFICATION, il software fa tutto da solo
# per bloccare i punti usare (set.seed) numero di pixel
soc <- unsuperClass(so, nClasses=3) # due set e una mappa, plotteremo la mappa
plot(soc$map)
