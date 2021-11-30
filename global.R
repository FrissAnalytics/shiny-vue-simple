library(shiny)
library(jsonlite)
library(tidyverse)
library(nycflights13)

airports2 <- airports

load("airports.RData")
load("arcs.RData")

destinations <- flights %>% group_by(dest) %>% summarise(count = n())

flights_summary <- flights %>% 
  group_by(year, month, day, origin, dest) %>% 
  summarise(count = n(),
            dist = mean(distance, na.rm = TRUE),
            dep_delay = mean(dep_delay, na.rm = TRUE),
            arr_delay = mean(arr_delay, na.rm = TRUE))


x <- flights_summary %>% filter(origin == "EWR" & dest == "ALB")

View(flights)
View(weather)
View(airlines)
View(planes)
View(airports)
View(airports2)

dim(flights)
dim(weather)
dim(airlines)
dim(planes)
dim(airports)
dim(airports2)


flights$dest %>% unique %>% length
flights$origin %>% unique %>% length