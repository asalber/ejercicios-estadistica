setwd("/media/alf/datos/drive/CEU/DOCENCIA/ejercicios/ejercicios_estadistica")
library(tikzDevice)
library(plyr)
library(plotly)
require(Hmisc)

# Polígono de frecuencias acumuladas del tiempo de duración de un examen
time = rep(c(30,60,90,120,150),c(9,6,14,26,11))
tikz(file="img/descriptiva/poligono_acumulado_tiempo_examen.tex", width=7, height=5)
par(cex.lab=1.2)
h <- hist(time, breaks=c(0,30,60,90,120,150), plot=FALSE)
h$counts <- cumsum(h[["counts"]])
freq <- c(0, h[["counts"]])
plot(h$breaks, freq, type="o", lwd=3, pch=16, col="royalblue", main="Tiempo en finalizar el examen", xlab="Tiempo (en minutos)", ylab="Número de estudiantes", axes=FALSE)
axis(1, at = c(0,30,60,90,120,150))
axis(2, at = seq(0,65,by=5))
abline(h=seq(0,65,by=5), col="gray", lty=3)
dev.off()


# Histograma del ímc por sexo
imc=rep(c(17.5,22.5,27.5,32.5,17.5,22.5,27.5,32.5,37.5),c(9,30,5,1,7,25,10,5,1))
gender=factor(rep(c("Male","Female"),c(45,48)))
tikz(file="img/descriptiva/histograma_imc_sexo.tex", width=5, height=5)
options(digits=1)
par(cex.lab=1.2)
out <- histbackback(split(imc, gender), xlim=c(-30,30), brks=c(15,20,25,30,35,40), main = 'Histograma del Índicie de Masa Corporal según Sexo', xlab=c("Mujeres", "Hombres"), ylab="IMC")
abline(v= (-25:25)*5 , col ="gray" , lty =3) 
barplot(-out$left, col="coral" , horiz=TRUE, space=0, add=TRUE, axes=FALSE) 
barplot(out$right, col="royalblue1", horiz=TRUE, space=0, add=TRUE, axes=FALSE) 
dev.off()

# Diagrama de caja
tikz(file="img/descriptiva/diagrama_caja_seguro_salud.tex", width=5, height=5)
par(cex.lab=1.2)
times=rep(c(0,1,2,3,4,5,7),c(4,8,6,3,2,1,1))
boxplot(times, main="Diagrama de caja del uso anual de un seguro de salud", xlab="Usos",col="coral", horizontal=TRUE)
dev.off()

# Diagrama de caja de edad según estado civil
tikz(file="img/descriptiva/diagrama_caja_edad_estado_civil.tex", width=5, height=5)
status=c("S","S","S","S","S","S","S","S","S","D","D","D","D","D","D","V","V","V","V","V","V","V","C","C","C","C","C")
age=c(31,45,45,35,21,38,62,32,31,62,34,52,59,69,62,80,68,65,40,78,69,75,31,65,59,51,71)
par(cex.lab=1.2)
boxplot(age~status, main="Diagrama de caja de edades según estado civil", xlab="Edad",col=rainbow(4,s=0.6), horizontal=TRUE)
dev.off()


