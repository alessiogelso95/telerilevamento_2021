# R_code_copernicus
#visualazing copernicus data

library(raster)
install.packages("ncdf4")
library(ncdf4)

setwd("C:/lab/")
globe <- raster("c_gls_LAI_202005130000_GLOBE_PROBAV_V1.5.1.nc")
#coordinate geometriche e non in gradi (-180° a +180°) con sistema di riferimento WGS84
cl <- colorRampPalette(c('light blue','green','red','yellow'))(100)
plot(globe, col=cl)
#funzione aggregate per aggregare i pixel, trasforma l'immagine in pixel minori, usando fact=10, diminuisco linearmente di 10 volte (10x10), file un po'più grezzi ma più leggeri
#ricampionamento
globeres<-aggregate(globe, fact=100)
plot(globeres, col=cl)
