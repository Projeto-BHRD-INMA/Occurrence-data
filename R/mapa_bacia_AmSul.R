# carregando pacotes
library(ggplot2)
library(rgdal)

# lendo os dados
## dados das especies de arvores
dados <- read.csv2("data/registros_BHRD_arvores.csv", sep = ";",
                   header = TRUE, stringsAsFactors = FALSE, 
                   fileEncoding = "latin1", dec = ".")
head(dados)
summary(dados)

## shp da bacia
bacia <- readOGR("data/shapefile/Bacia/munic_BHRD.shp")

## Am do Sul
SA <- readOGR("data/shapefile/SA/SouthAmerica.shp")

SAmap <- ggplot() +
  geom_polygon(data = SA, aes(long, lat, group = group), fill = 'grey80') +
  geom_polygon(data = bacia, aes(long, lat, group = group),
               fill = "grey30",
               alpha = 0.7) + theme_void() +
  annotate(geom = "text", x = -60, y = -15, label = "South \n America", 
           color = "grey30", size = 3) #+
#annotate(geom = "text", x = -59, y = -7, label = "Brazilian Amazon", 
#    color = "grey90", size = 1.5)


SAmap
