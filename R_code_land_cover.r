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

#unsupervised classification
d1c <- unsuperClass(defor1, nClasses=2)
plot(d1c$map)
d2c <- unsuperClass(defor2, nClasses=2)
plot(d2c$map)

#calcolo la frequenza statistica, il numero di pixeel di una determinata classe
freq(d1c$map)
#value cunt
#[1,]     1 305489
#[2,]     2  35803

s1 <- 305489 + 35803
prop1 <- freq(d1c$map) /s1
 
#          value     count
#[1,] 0.8950957 (prop. foresta)
#[2,] 1049043 (prop. argicoltura)

frequ(d2c$map)
#    value  count
#[1,]     1 164407
#[2,]     2 178319
s2 <- 342726
prop2 <- freq(d2c$map) /s2

#            value     count
#[1,] 0.4797039 (prop. agricoltura)
#[2,] 0.5202961 (prop. foresta)

#fattori sono variabili categorieche (foresta e agricoltura)
#build a dataframe
cover <- c("Forest", "Agriculture")
percent_1992 <- c(89.50, 10.49) 
percent_2006 <- c(52.02, 47.97)
percentages <- data.frame(cover, percent_1992, percent_2006)
percentages
#             cover percent_1992  percent_2006
#1      Forest        89.50        52.02
#2  Agriculture       10.49        47.97
ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
p1 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
grid.arrange(p1, p2, nrow=1)
