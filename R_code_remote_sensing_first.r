# Il mio primo codice in R per il telerilevamento
#  setwd ("C: / lab /")
# install.packeges ("raster")
library(raster)
brick ("p224r63_2011_masked.grd")
p224r63_2011 <- brick ("p224r63_2011_masked.grd")

