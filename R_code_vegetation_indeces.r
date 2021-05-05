#R_code_vegetation_indeces.r
# ci troviamo a Rio Peixoto, in Brasile
# si analizza la deforestazione tramite indici di vegetazione
#immagini già processate, dove la banda dell'infrarosso sul red, colore rosso dell'immagine
library(raster)
library(RStoolbox)

setwd("C:/lab/deforestazione")
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

# 1=infrarosso
# 2=rosso
# 3=verde

par(mfrow=c(2,1))
plotRGB(defor1,1, 2, 3, stretch="Lin")
plotRGB(defor2,1, 2, 3, stretch="Lin")

# defor1
#class      : RasterBrick 
#dimensions : 478, 714, 341292, 3  (nrow, ncol, ncell, nlayers)
#resolution : 1, 1  (x, y)
#extent     : 0, 714, 0, 478  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : C:/lab/deforestazione/defor1.jpg 
#names      : defor1.1, defor1.2, defor1.3 
#min values :        0,        0,        0 
#max values :      255,      255,      255 

# defor2
#class      : RasterBrick 
#dimensions : 478, 717, 342726, 3  (nrow, ncol, ncell, nlayers)
#resolution : 1, 1  (x, y)
#extent     : 0, 717, 0, 478  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : C:/lab/deforestazione/defor2.jpg 
#names      : defor2.1, defor2.2, defor2.3 
#min values :        0,        0,        0 
#max values :      255,      255,      255 

#indice di deforestazione
#per ogni pixel prendiamo la banda in infrarosso e lo sottraiamo all'altro valore, avremo la banda formata dalla differenza tra infrarosso e rosso e
#dvi1
dvi1 <- defor1$defor1.1 - defor1$defor1.2 
plot(dvi1)
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi1, col=cl, main="DVI at time 1")
 #dvi2
dvi2 <- defor2$defor2.1 - defor2$defor2.2
plot(dvi2)
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi2, col=cl, main="DVI at time2")

#per confrontarle
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cl, main="DVI at time 2")

#per vedere come cambia la situazione
difdvi <- dvi1 - dvi2
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(dfidvi, col=cld, main="Differenza tra i DVI")


# idice che normalizza i valori sulla sommatoria delle variabili 
# con valori che vanno da +1 a -1
#NDVI, indice normalizzato per la somma, utile per quando si passa da immagine a idversa estensione
ndvi1=dvi1 / (defor1$defor1.1 + defor1$defor1.2)
ndvi2=dvi2 / (defor2$defor2.1 + defor2$defor2.2)

par(mfrow=c(2,1))
plot(ndvi1, col=cl, main="NDVI at time 1")
plot(ndvi2, col=cl, main="NDVI at time 2")

#Spectral indices (RStoolbox)
vi <- spectralIndices(defor1, green=3, red=2, nir=1)
plot(vi, col=cl)
# integer ci dice che possiamo dichiarare anche un numero
vi1 <- spectralIndices(defor1, green=3, red=2, nir=1)
plot(vi, col=cl)
vi2 <- spectralIndices(defor2, green=3, red=2, nir=1)
plot(vi, col=cl)

difndvi <- ndvi1 - ndvi2
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difndvi, col=cld)

library(rasterdiv) #for the worlwide NDVI
plot(copNDVI) #funzione per cambiare l'immagine, qui vogliao togliere l'acqua
# Pixels con valori 253,254 e 255 (acqua) possono non essere presi in considerazione
copNDVI <- reclassify(copNDVI, cbind(253:255,NA)) 
plot(copNDVI)

#rasterVis package needed:
levelplot(copNDVI)


