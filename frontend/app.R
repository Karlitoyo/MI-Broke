cat("starting M I Broke app...", file = stderr())
source(local = TRUE, "00_config/00_packages.R")
source(local = TRUE, "00_config/01_general_config.R")

source(local = TRUE, "01_ui/01_ui_input_tab.R")
#source(local = TRUE, "01_ui/02_ui_output_tab.R")

'%!in%' <- function(x,y)!('%in%'(x,y))


header <- dashboardHeaderPlus(
  #title = "M I Broke"
  title = tagList(
    span(class = "logo-lg", "M I Broke dashboard"),
    img(src = "www/logos/logoEU"))
)


body <- dashboardBody(
  tabItems(
    ui_input_tab
    #ui_output_tab
  )
)


ui <- tagList(
  tags$head(tags$script(src="js/helper_functions.js")),
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "css/shinydashboard_modifications.css")),
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "css/leaflet_fix.css")),
  
  shinyjs::useShinyjs(),
  
  dashboardPagePlus(
    title = "M I Broke dashboard",
    collapse_sidebar = TRUE,
    header = header,
    sidebar = dashboardSidebar(
      sidebarMenu(
        id = "sidebar",
        sidebarMenuOutput("user_role_adapted_sidebar"),
        style = "position: fixed; overflow: visible;"
      )
    ),
    body = body
  )
)


server <- function(input, output, session) {
  
  cdata <- session$clientData # Required for making plotly draw its plots in the (differing) size of the parenting divs. 
  
  updateSelectInput(
    session = session,
    inputId = "country",
    selected = "Germany"
  )
  
  addClass(selector = "body", class = "sidebar-collapse")
  
  source(local = TRUE, "02_server/00_sidebar.R")
  source(local = TRUE, "00_config/01_general_config.R")
  source(local = TRUE, "02_server/01_input_tab.R")
  #source(local = TRUE, "02_server/02_output_tab.R")
  
}


shinyApp(ui = ui, server = server)