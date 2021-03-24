# Il mio primo codice in R per il telerilevamento
setwd library (raster)
Carico il pacchetto richiesto: sp
> setwd ("C:/lab/")
> p224r63_2011 <- brick ("p224r63_2011_masked.grd")
> cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
> plot (p224r63_2011, col=cl)
> p224r63_2011
class      : RasterBrick 
dimensions : 1499, 2967, 4447533, 7  (nrow, ncol, ncell, nlayers)
resolution : 30, 30  (x, y)
extent     : 579765, 668775, -522705, -477735  (xmin, xmax, ymin, ymax)
crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
source     : C:/lab/p224r63_2011_masked.grd 
names      :       B1_sre,       B2_sre,       B3_sre,       B4_sre,       B5_sre,        B6_bt,       B7_sre 
min values : 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.196277e-02, 4.116526e-03, 2.951000e+02, 0.000000e+00 
max values :    0.1249041,    0.2563655,    0.2591587,    0.5592193,    0.4894984,  305.2000000,    0.3692634 

> dev.off()
null device 
          1 
> dev.off ()
Error in dev.off() : 
  non posso chiudere il dispositivo 1 (dispositivo null)
> dev.off()
Error in dev.off() : 
  non posso chiudere il dispositivo 1 (dispositivo null)
> plot(p224r63_2011$B1_sre)
> cl <- colorRampPalette(c("red", "pink", "light blue")) (100)
> plot (p224r63_2011, col=cl)
> plot(p224r63_2011$B1_sre)

# con la funzione setwd spieghiamo a R dove andare a prendere i dati
# i dati sono all'interno della cartella lab
# la cartella lab deve essere nell' unità :C
# install.packages ("raster")
library(raster)
# la funzione library richiama il pacchetto che abbiamo installato su R
brick ("p224r63_2011_masked.grd")
# la funzione brick serve a importare tutto il pacchetto dell'immagine satellitare
p224r63_2011 <- brick ("p224r63_2011_masked.grd")
# posso associare la funzione brick ad un certo oggetto
plot (p224r63_2011)
# la funzione plotta in R il file selezionato
# immagini analizzate nelle bande blu all'infrarosso termico (B1-B7)
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
# cambiare colori
plot (p224r63_2011, col=cl)
# cambiato la legenda dei colori per ogni banda
p224r63_2011 # permette di vedere da cosa è composta
# Bande landsat
# B1:banda blu 
# B2: banda verde
# B3: banda rosso
#B4: infrarosso vicino (vicino alla parte visibile)
# B5: infrarosso medio 
# B6: infrarosso termico
#B7: infrarosso medio
dev.off()
# ripulisce la finestra grafica (le impostazioni ripartono da zero)
# vogliamo plottare solo la bada blu (B1.sre) dell'immagine che ci serve (p224r63_2011)
# $ lega l'immagine della banda al plot
plot(p224r63_2011$B1_sre)
#plot B1 con una scala di colori diversa
plot(p224r63_2011$B1_sre, col=cl)
# par (plottare immaginie banda blu e accando l'immagine della banda del verde), multiframe (mf) facendo un sistema 
par(mfrow= c(1,2)) # vettore due colonne e una riga
par(mfrow=c(2,1)) # vettore due righe e una colonna
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre) 
# plottare le prime quattro immagini di Landsat
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)
# plottare le immagini in un quadrato
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)
# associare una palette di colori a ogni banda
 par(mfrow=c(2,2))

clb <- colorRampPalette(c("dark blue","blue","light blue")) (100)
plot(p224r63_2011$B1_sre, col=clb)
clg <- colorRampPalette(c("dark green","green","light green")) (100)
plot(p224r63_2011$B2_sre, col=clg)
clr <- colorRampPalette(c("dark red","red","pink")) (100)
plot(p224r63_2011$B3_sre, col=clr)
clnir <- colorRampPalette(c("red","orange","yellow")) (100)
plot(p224r63_2011$B4_sre, col=clnir)
