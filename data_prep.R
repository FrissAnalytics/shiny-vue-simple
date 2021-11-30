load("airports.RData")

# add origin and destination lat/long info 
m1       <- match(flights$origin, airports$IATA)
m2       <- match(flights$dest, airports$IATA)
flights2 <- data.frame(flights, origin = airports[m1,], dest = airports[m2,])

# extract relevant data to draw arcs on the globe
arcs     <- flights2[,c( grep("origin.",names(flights2), fixed = TRUE),  grep("dest",names(flights2), fixed = TRUE))] %>% unique

names(arcs) <- c("origin_name", "origin_city", "origin_country", "origin_IATA", 
  "origin_lat", "origin_lng", "origin_altitude", "dest", "dest_name", 
  "dest_city", "dest_country", "dest_IATA", "dest_lat", "dest_lng", 
  "dest_altitude")


save(arcs, file = "arcs.RData")
