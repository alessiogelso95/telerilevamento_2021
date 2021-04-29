#R_code_vegetation_indeces.r
# ci troviamo a Rio Peixoto, in Brasile
# si analizza la deforestazione tramite indici di vegetazione
#immagini già processate, dove la banda dell'infrarosso sul red, colore rosso dell'immagine
library(raster)
setwd("C:/lab/deforestazione")
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

# 1=infrarosso
# 2=rosso
# 3=verde

par(mfrow=c(2,1))
plotRGB(defor1,1, 2, 3, stretch="Lin")
plotRGB(defor2,1, 2, 3, stretch="Lin")
