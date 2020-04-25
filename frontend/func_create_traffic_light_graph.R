### traffic light

for(i in c("tidyverse", "plotly")){
  if(i %in% rownames(installed.packages())){
    library(i, character.only = T)
  }else{
    install.packages(i)
    library(i, character.only = T)
  }
}

## create pie chart
create_traffic_light <- function(indicator = "red", ...){
  
  colors = c("red" = "rgb(255,0,0)", "orange" = "rgb(255,69,0)", "green" = "rgb(50,205,50)", "grey" = "rgb(105,105,105)")
  
  temp_df <- data.frame(constant = 1)
  
  temp_color <- data.frame(colors = c("red", "orange", "green"),
                           row_num = c(0, 1, 2))
  
  for(i in 1:nrow(temp_color)){
    assign(paste0("p_", temp_color[i,1]), plot_ly(data = temp_df, type ="pie", values = ~constant, domain = list(row = temp_color[i, 2]),
                                                 textposition = "none",
                                                 hoverinfo  = "none",
                                                 marker = list(colors = colors[i],line = list(color = 'rgb(0,0,0)', width = 2)))%>%
             layout(showlegend = F,
                    grid=list(rows=3, columns=1),
                    xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                    yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)) )
  }
  
  for(j in 0:2){
    assign(paste0("p_grey_", j), plot_ly(data = temp_df, type ="pie", values = ~constant, domain = list(row = j),
                        textposition = "none",
                        hoverinfo  = "none",
                        marker = list(colors = colors["grey"],line = list(color = 'rgb(0,0,0)', width = 2)))%>%
      layout(showlegend = F,
             grid=list(rows=3, columns=1),
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)))
    
  }  
  
  if(indicator %in% "red"){
    p_temp <- subplot(p_red, p_grey_1, p_grey_2, nrows = 3)
    
    cat("currently the traffic light is RED \n")
    
    
  }else if(indicator %in% "orange"){
    p_temp <- subplot(p_grey_0, p_orange, p_grey_2, nrows = 3)
    
    cat("currently the traffic light is ORANGE \n")
    
  }else{
    p_temp <- subplot(p_grey_0, p_grey_1, p_green, nrows = 3)
    
    cat("currently the traffic light is GREEN \n")
  }
  
  p_temp
}
