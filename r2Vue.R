rBus <- function (message){
  session$sendCustomMessage("r2vue", message %>% toJSON(auto_unbox = TRUE))
}

rVuexSetState <- function (key, value, auto_unbox = TRUE){
  session$sendCustomMessage("rVuexSetState", list(key = key, value = value %>% toJSON(auto_unbox = auto_unbox)))
}