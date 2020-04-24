output$user_role_adapted_sidebar <- renderMenu({
  sidebarMenu(
    id = "sidebar_menu",
    style = "position: fixed; overflow: visible;",
    menuItem("Parameters", 
             tabName = "input", 
             icon = icon("compass", 
                         lib = "font-awesome"),
             selected = TRUE
             )
    )
})

