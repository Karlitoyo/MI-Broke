ui_input_tab <- tabItem(
  tabName = "input",
  fluidRow(
    infoBoxOutput("country"),
    infoBoxOutput("industry")
  ),
  
  fluidRow(
    box(
      width = 12,
      status = "primary",
      solidHeader = TRUE,
      collapsible = TRUE,
      title = "Enter details",
      fluidRow(
        column(
          6,
          selectInput(
            inputId = "country",
            label = "Country",
            choices = countries
          )
        ),
        column(
          6,
          selectInput(
            inputId = "industry",
            label = "Industry",
            choices = industries
          )
        )
      )
    )
  ),
  
  fluidRow(
    box(
      width = 12,
      status = "primary",
      solidHeader = TRUE,
      collapsible = TRUE,
      title = "Choose parameters",

      fluidRow(
        column(
          6,
          textInput(
            inputId = "capital",
            label = p("Capital",
                      tipify(el = bsButton(inputId = "capital_button",
                                           label = "?",
                                           style = "primary",
                                           size = "extra-small"
                      ),
                      title = "Please enter capital value.",
                      placement = "right",
                      trigger = "hover"
                      )
            ),
            value = ""
          ),
          textInput(
            inputId = "assets",
            label = "Assets",
            value = ""
          )
        ),
        column(
          6,
          textInput(
            inputId = "rent",
            label = "Rent",
            value = ""
          ),
          textInput(
            inputId = "wages",
            label = "Wages",
            value = ""
          ),
          textInput(
            inputId = "loans",
            label = "Loan repayments",
            value = ""
          ),
          textInput(
            inputId = "other_costs",
            label = "Other costs",
            value = ""
          ),
          tags$div(
            align = "left",
            style = "margin-left: 2px;",
            br(),
            actionButton(
              class = "btn-primary",
              style = "color:#FFFFFF;",
              "estimate",
              "Estimate"
            )
          )
        )
      )
    )
  )
  
  # fluidRow(
  #   box(
  #     width = 12,
  #     status = "primary",
  #     solidHeader = TRUE,
  #     collapsible = TRUE,
  #     title = "Preceeding runs",
  #     dataTableOutput("preceding_runs")
  #  )
  #)
)