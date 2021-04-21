# R_code_knitr.r
#impostiamo la working directory su lab
setwd("C:/lab/")
library(knitr)  # require può fare la stessa funzione di "library"

#Generiamo un report, che va a prendere il codice salvato in precedenza (in questo caso, il codice di greenland)
stitch("C:/lab/R_code_greenland.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))

#aprire il file testo creato, con un qualunque software di lettura testo, per vedere come è fatto
