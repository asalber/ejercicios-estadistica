setwd("/media/alf/datos/drive/CEU/DOCENCIA/ejercicios/ejercicios_estadistica/img/variables_aleatorias_continuas")
library(tikzDevice)
library(plyr)
library(shape)
require(Hmisc)

# Color definition
color1<-rgb(5,161,230,max=255)
color2<-rgb(238,50,36,max=255)
color3<-"green3"
color4<-rgb(169,78,145,max=255)
color5<-rgb(238,50,36,alpha=100,max=255)


options(tikzDefaultEngine = "xetex")

# Exercise 
tikz(file="funcion_densidad_1.tex", width=4, height=4)
par(mar=c(3.5,3.5,3,1), mgp=c(2.2,0.6,0), las=1)
x <- c(0,1,2)
y <- c(0,1,0)
plot(x, y, type="l", xlab="X", ylim=c(0,1.2), ylab="Densidad de probabilidad $f(x)$", yaxs="i", col=color1, lwd=2)
segments(0,0,0,1, lty=2, col="gray")
segments(1,0,1,1, lty=2, col="gray")
dev.off()




