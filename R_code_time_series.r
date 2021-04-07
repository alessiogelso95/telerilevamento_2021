# Time series analysis
#Greenland increase of temperature
# Data semplified from Emanuela Cosma
#install.packages("raster")
library(raster)
setwd("C:/lab/greenland")

# Ogni strato rappresenta la stima della temperatura che deriva dal programma Copernicus
lst_2000 <- raster("lst_2000.tif")
lst_2005<- raster("lst_2005.tif")
lst_2010<- raster("lst_2010.tif")
lst_2015<- raster("lst_2015.tif")

# pervisualizzare assieme usare la funzione par
par(mfrow=c(2,2))
plot(lst_2000) 
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

#bit, spazio di informazione nero=1 bianco=0. 
# 2bit 00 (bianco)/01(grigio)/10 (grigio scuro)/11 (nero)
# 3bit 000 (1)/001 (2)/ 010 (3)/ 100 (4)/ 101 (5)/110 (6)/ 111(7)/ 001(8)
# numero di valori, secondo il n di bit è 2^bit
#molte immagini sono a 8bit (2^8=256 valori)
# 2^16=65536 valori (immagini codificate a 16 bit, con valori ripetuti, diminuiscono la dimensione dell'immagine) 
# maggiore è il valore di digital mapper e miaggiore è la temperatura
lapply # applicare una funzione a una certa lista di file
# crea lista file che r usa 
list.files() # pattern= spiega al software che file cercare attraverso il nome
rlist<-list.files(pattern="lst")
rlist # ha creato la lista con tutti i flie con lo stesso nome
#funzione lapply= lista(rlist),funzione da applicare(raster) 
import<-lapply(rlist,raster)
import
#importati i soingoli file
# costruire il pacchetto di file tutti insieme e gli diamo un nome (funzione stack)
TGr<-stack(import)
plot (TGr)
#2000=r/2005=g/2010=b
plotRGB(TGr,1,2,3, stretch="Lin") 
#2005=r/2010=g/2015=b
plotRGB(TGr,2,3,4, stretch="Lin")
install.packages("rasterVis")
