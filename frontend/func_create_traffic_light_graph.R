### traffic light
rm(list = ls())
library(tidyverse)
library(plotly)
library(htmlwidgets)

### define colors


### aux data.frame
temp_df <- data.frame(constant = 1)
## create pie chart
create_traffic_light <- function(indicator = "red", ...){
  
  colors = c("red" = "rgb(255,0,0)", "orange" = "rgb(255,255,0)", "green" = "rgb(50,205,50)", "grey" = "rgb(105,105,105)")
  
  temp_df <- data.frame(constant = 1)
  
  p_red <- plot_ly(data = temp_df, type ="pie", values = ~constant, domain = list(row = 0),
                   textposition = "none",
                   hoverinfo  = "none",
                   marker = list(colors = colors["red"],line = list(color = 'rgb(0,0,0)', width = 2)))%>%
    layout(showlegend = F,
           grid=list(rows=3, columns=1),
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  
  p_orange <- plot_ly(data = temp_df, type ="pie", values = ~constant, domain = list(row = 1),
                      textposition = "none",
                      hoverinfo  = "none",
                      marker = list(colors = colors["orange"],line = list(color = 'rgb(0,0,0)', width = 2)))%>%
    layout(showlegend = F,
           grid=list(rows=3, columns=1),
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  
  
  p_green <- plot_ly(data = temp_df, type ="pie", values = ~constant, domain = list(row = 2),
                     textposition = "none",
                     hoverinfo  = "none",
                     marker = list(colors = colors["green"],line = list(color = 'rgb(0,0,0)', width = 2)))%>%
    layout(showlegend = F,
           grid=list(rows=3, columns=1),
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  
  p_grey_0 <- plot_ly(data = temp_df, type ="pie", values = ~constant, domain = list(row = 0),
                     textposition = "none",
                     hoverinfo  = "none",
                     marker = list(colors = colors["grey"],line = list(color = 'rgb(0,0,0)', width = 2)))%>%
    layout(showlegend = F,
           grid=list(rows=3, columns=1),
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  
  p_grey_1 <- plot_ly(data = temp_df, type ="pie", values = ~constant, domain = list(row = 1),
                   textposition = "none",
                   hoverinfo  = "none",
                   marker = list(colors = colors["grey"],line = list(color = 'rgb(0,0,0)', width = 2)))%>%
    layout(showlegend = F,
           grid=list(rows=3, columns=1),
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  
  
  p_grey_2 <- plot_ly(data = temp_df, type ="pie", values = ~constant, domain = list(row = 2),
                     textposition = "none",
                     hoverinfo  = "none",
                     marker = list(colors = colors["grey"],line = list(color = 'rgb(0,0,0)', width = 2)))%>%
    layout(showlegend = F,
           grid=list(rows=3, columns=1),
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  
  
  
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

