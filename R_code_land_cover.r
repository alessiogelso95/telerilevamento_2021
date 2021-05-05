R_code_land_cover.r

setwd("C:/lab/deforestazione")
library(raster)
library(RStoolbox)
#install.packages("ggplot2")
library(ggplot2)
#multiframe with ggplot2 (gridExtra)
install.packages("gridExtra")
library(gridExtra)

defor1 <- brick("defor1.jpg")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")

defor2 <- brick("defor2.jpg")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

grid.arrange(p1, p2, nrow=2)


p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
grid.arrange(p1, p2, nrow=2)
