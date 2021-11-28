library(shiny)
library(jsonlite)
library(tidyverse)
library(nycflights13)

load("airports.RData")

destinations <- flights %>% group_by(dest) %>% summarise(count = n())