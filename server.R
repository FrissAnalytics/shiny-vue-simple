function(input, output, session) {
  
 source("r2Vue.R" , local = TRUE)
 
 rVuexSetState("destinations", destinations )
 
 rVuexSetState("flights", flights %>% head )
 
 rVuexSetState("airports", flights %>% head )
 
 observeEvent(input$vue_data, {
   
   cat("\nvue:", input$vue_data)
 })
 
}