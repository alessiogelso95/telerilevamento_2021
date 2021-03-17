# Il mio primo codice in R per il telerilevamento
setwd ("C: / lab /")
# con la funzione setwd spieghiamo a R dove andare a prendere i dati
# i dati sono all'interno della cartella lab
# la cartella lab deve essere nell' unità :C
# install.packeges ("raster")
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
