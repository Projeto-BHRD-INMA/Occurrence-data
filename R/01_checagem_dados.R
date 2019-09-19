# Script para checagem de N de especies e registros na BHRD

# carregando pacotes
library(rgdal)
#library(ggsn); library(ggplot2); library(sf)

# lendo os dados
## dados das especies de arvores
dados <- read.csv2("data/registros_BHRD_arvores.csv", sep=";", 
                   header=TRUE, stringsAsFactors=FALSE, fileEncoding="latin1", dec=".")
head(dados)
summary(dados)
## shp da bacia
bacia <- readOGR("data/shapefile/Bacia/munic_BHRD.shp")

## uso do solo
solo <- readOGR("data/shapefile/Bacia/uso_solo/uso_solo_bhrd.shp")

plot(bacia)

coord <- dados

coordinates(coord) <- ~longitude+latitude

# sp dentro da bacia
proj4string(bacia)
proj4string(coord)

bacia <- spTransform(bacia, CRS("+proj=longlat +datum=WGS84"))
proj4string(coord) <- "+proj=longlat +datum=WGS84"

sp.bacia <- coord[bacia,]
mycol <- rgb(0, 78, 56, max = 255, alpha = 125)


png("figs/arvores_bacia.png")
plot(bacia, main="Registros de árvores na BHRD")
points(latitude ~ longitude, sp.bacia, col=mycol, pch=19)
dev.off()

dim(sp.bacia)
dim(dados)

length(unique(sp.bacia$especies))

