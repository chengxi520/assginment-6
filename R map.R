library(ggmap)
library(tidyverse)

# simple mapping with ggmap

# grab a center/zoom map and compute its bounding box
gc <- geocode("town of bude")
map <- get_map(gc)
bb <- attr(map, "bb")
bbox <- bb2bbox(bb)


ggmap(map) +
  geom_point(
    aes(x = lon, y = lat),
    data = gc, color = "red", size = 1
  )

map1 <- get_map(gc, zoom=16)

ggmap(map1) +
  geom_point(
    aes(x = lon, y = lat),
    data = gc, color = "blue", size = 3
  )

#set the zoom
map2 <- get_map("town of bude", zoom= 16,maptype = "roadmap")
ggmap(map2)

map3 <- get_map("town of bude",zoom=16, maptype= "watercolor")
ggmap(map3)

x <- "vocation stops" 
vs <- "vs address"
i <- c(1:9)
x[i] <- c("Breakwater Beach,UK", "Summerleaze Beach","Crooklets Beach","Northcott Mouth Beach,UK","Widemouth Beach","Sandy Mouth Beach,UK","Duckpool Beach,UK","Millook Haven Beach","cricket grounds,UK")

View(x)

for(i in 1:9){
  vs <- geocode(x)
}
View(vs)
rownames(vs) <- x[1:9]

ggmap(get_googlemap(center = 'town of bude',zoom= 12,maptype = "roadmap"))+
geom_point(data=vs,aes(x=lon,y=lat),colour = 'red',size=1)

pub <-  geocode("36 Lansdown Rd, Bude EX23 8BN, UK")
pub

pub2 <- get_googlemap(center = "town of bude", source="google",zoom = 16)
ggmap(pub2,extent = "normal",zoom=25)+geom_point(data=pub,aes(x=lon,y=lat),color="blue")

from <- "Breakwater Beach,UK"
to <- "36 Lansdown Rd, Bude EX23 8BN, UK"
route_df <- route(from, to, mode = "walking",structure = "route")
