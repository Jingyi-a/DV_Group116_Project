library(shiny)
library(shinydashboard)
library(leaflet)
library(DT)
library(plotly)
library(tidyverse)

ui <- dashboardPage(
  skin = "red",
  dashboardHeader(title = "F1"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "page1", icon = icon("home")),
      menuItem(
        "Global Info",
        tabName = "page2",
        icon = icon("flag-checkered")
      ),
      menuItem("Constructor", tabName = "page3", icon = icon("car")),
      menuItem("Driver", tabName = "page4", icon = icon("user")),
      menuItem("Circuit", tabName = "page5", icon =
                 icon("road")),
      menuItem(
        "Data Source",
        tabName = "page6",
        icon = icon("database")
      )
    )
  ),
  dashboardBody(
    #######
    #Page 1
    #######
    tabItems(
      tabItem(
        tabName = "page1",
        h2(strong("Home")),
        fluidRow(
          box(
            title = "F1 overview",
            solidHeader = TRUE,
            status = "success",
            width = 12,
            collapsible = TRUE,
            column(12,
                   tags$div(fluidRow(
                     column(
                       8,
                       "Formula 1 racing began in 1950 and is the world’s most prestigious motor racing competition, as well as the world’s most popular annual sporting series: The 2019 FIA Formula One World Championship runs from March to December and spans 21 races in 21 countries across four continents. Formula One World Championship Limited is part of Formula 1 and holds the exclusive commercial rights to the FIA Formula One World Championship.",
                       br(),
                       a(h5("Source", href = 'https://corp.formula1.com/about-f1'))
                     ),
                     
                     column(
                       4,
                       img(src = "https://logok.org/wp-content/uploads/2014/06/Formula-1-logo-2017-logotype.png ", width =
                             30,
                           style = "display: block;margin-left: auto;margin-right: auto;")
                     )
                   )))
          )
        ),
        fluidRow(
          box(
            title = "User Guide",
            solidHeader = TRUE,
            status = "primary",
            width = 12,
            collapsible = TRUE,
            column(9,
                   "Welcome to the world of Formula 1.")
          )
        ),
        
        fluidRow(
          box(
            title = "About Us",
            solidHeader = TRUE,
            status = "info",
            width = 12,
            collapsible = TRUE,
            column(12,
                   tags$div(fluidRow(
                     column(9,
                            "content3"),
                     column(3, "image2")
                   )))
          )
        )
      ),
      #######
      #Page 2
      #######
      tabItem(
        tabName = "page2",
        h2(strong(
          "An Overview of the History of Formula 1 (1950-2022)"
        )),
        br(),
        fluidRow(
          column(
            4,
            h3('The Grand Prix'),
            align = 'center',
            h1(strong('1067'),
               style = "color:red; font-size:80px",
               align = 'center'),
            h6(
              'Total Grand Prix 1950-2022',
              style = 'color:Grey; font-size:15px',
              align = 'center'
            ),
            br(),
            h6(
              '1st Grand Prix: British Grand Prix @ May 13th, 1950',
              style = 'color:Grey; font-size:15px',
              align = 'center'
            ),
            h6(
              'Lastest Grand Prix: Austrian Grand Prix @ Jul 10th, 2022',
              style = 'color:Grey; font-size:15px',
              align = 'center'
            )
          ),
          column(
            4,
            h3('Most Successful Constructor', align = 'center'),
            h1(strong('Ferrari'),
               style = "color:red; font-size:80px",
               align = 'center'),
            br(),
            h4(
              '16',
              style = 'color:Grey; font-size:60px',
              align = 'center',
              "Constructors' Championships",
              style = 'color:Grey; font-size:15px',
            ),
            h6('242 Grand Prix Wins',
               style = 'color:Grey; font-size:15px',
               align = 'center'),
            h6(
              "15 Drivers'Championships",
              style = 'color:Grey; font-size:15px',
              align = 'center'
            )
          ),
          column(
            4,
            h3('Most Successful Driver', align = 'center'),
            h1(
              strong('Michael Schumacher'),
              style = "color:red; font-size:40px",
              align = 'center'
            ),
            h6("7 World Championships",
               style = 'color:Grey; font-size:15px',
               align = 'center'),
            h6("91 Grand Prix Wins",
               style = 'color:Grey; font-size:15px',
               align = 'center'),
            h1(strong('Lewis Hamilton'),
               style = 'color:red; font-size:40px',
               align = 'center'),
            h6("7 World Championships",
               style = 'color:Grey; font-size:15px',
               align = 'center'),
            h6("103 Grand Prix Wins",
               style = 'color:Grey; font-size:15px',
               align = 'center')
          )
        ),
        hr(style = "border-color: red"),
        
        fluidRow(column(
          8,
          h3('World Championship', align = 'center'),
          br(),
          tabsetPanel(tabPanel(
            h5('World Championship Titles by Driver', align = 'center'),
            div('histogram 1')
          ),
          tabPanel(
            h5('World Championship Titles by Constructor', align = 'center'),
            div('histogram 2')
          ))
          
          
        ),
        column(
          4, h3('Distribution of Driver Nationalities')
        ))
      ),
      #######
      #Page 3
      #######
      tabItem(
        tabName = "page3",
        h2(strong("Constructors")),
        box(
          title = "User Guide",
          solidHeader = TRUE,
          status = "danger",
          width = 12,
          collapsible = TRUE,
          "content1"
        ),
        
        dataTableOutput('table1'),
        
        h2("Constructors Overview"),
        tabsetPanel(
          tabPanel(
            "Constructors Info",
            icon = icon("info"),
            selectInput(
              inputId = "Constructors",
              label = "Constructor",
              choices = c("a", "b", "c")
            ),
            fluidRow(column(
              6,
              box(
                title = "Profile",
                status = "warning",
                solidHeader = TRUE,
                "Nationality",
                hr(),
                "Current Driver"
              )
            ),
            column(
              6,
              box(
                title = "Stats",
                status = "warning",
                solidHeader = TRUE,
                
                plotOutput("plot2")
              )
            )),
            fluidRow(column(
              6,
              box(
                title = "About",
                status = "warning",
                solidHeader = TRUE,
                "Brief Introduction",
                plotOutput("plot3")
              )
            ),
            column(
              6,
              box(
                title = "Seasons",
                status = "warning",
                solidHeader = TRUE,
                "histogram",
                plotOutput("plot4")
              )
              
              
              
            ))
          ),
          tabPanel("Word Cloud", icon = icon("cloud"), "Word Cloud"),
          tabPanel("Video", icon = icon("video"), "Video")
        )
      ),
      ######
      #Page4
      ######
      tabItem(
        tabName = "page4",
        h2(strong("The Driver")),
        fluidRow(column(
          12,
          h4(""),
          
          box(
            h5(
              "This page visualizes the best driver and the most successful drivers in the selected year.
                           in the",
              em(strong("last 5 years (2017-2021)")),
              ". You can use",
              strong("Select Year"),
              "function below to filter. ",
              "This page also introduces the profile of each driver",
              ". ",
            ),
            title = "User Guide",
            status = "warning",
            solidHeader = TRUE,
            collapsible = TRUE,
            collapsed = FALSE,
            width = "100%"
          )
          
        )),
        hr(),
        fluidRow(
          box(
            title = "Drivers of the Year",
            solidHeader = TRUE,
            status = "primary",
            width = 12,
            collapsible = TRUE,
            sliderInput(
              "year",
              "Select Year:",
              min = 2017,
              max = 2021,
              value = 2017,
              step = 1,
              animate = animationOptions(interval = 1500, loop = FALSE)
            ),
            fluidRow(
              column(6,
                     "Best driver",
                     textOutput("text1")),
              column(6,
                     "Most successful drivers",
                     plotOutput("plot1"))
              
            )
          ),
          
          box(
            title = "Current Drivers Profile",
            solidHeader = TRUE,
            status = "primary",
            width = 12,
            collapsible = TRUE,
            selectInput(
              inputId = "Driver",
              label = "Drivers",
              choices = c(""),
              width = "200px"
            ),
            fluidRow(
              column(6, "Bio", textOutput("text2"), align = "center"),
              column(6, "Photo", imageOutput("image1"), align = "center")
            ),
            fluidRow(
              column(6, "Stats", plotOutput("plot2"), align = "center"),
              column(6, "News", htmlOutput("HTML1"), align = "center")
            )
          )
        )
      ),
      #######
      #Page 5
      #######
      tabItem(tabName = "page5",
              h2(strong("The Circuits")),
              fluidRow(column(
                12,
                h4(""),
                
                box(
                  h5(
                    "The first chart visualizes the circuits of F1 in the last five years ",
                    em(strong(" (2017-2021)")),
                    "of different countries. You can use",
                    strong("Select country"),
                    "function below to filter. These maps below the first chart
                            visualize the details about each circuit in the",
                    em(strong("selected country")),
                    ".",
                  ),
                  title = "Instruction",
                  status = "warning",
                  solidHeader = TRUE,
                  collapsible = TRUE,
                  collapsed = FALSE,
                  width = "100%"
                ),
                hr(),
                
                fluidRow(
                  box(
                    solidHeader = TRUE,
                    status = "primary",
                    width = 12,
                    collapsible = TRUE,
                    
                    column(
                      4,
                      selectInput("Country",
                                  "Select Country:",
                                  "",
                                  multiple = FALSE)
                    ),
                    column(9, plotlyOutput("lapTimesPlot"))
                  )
                  ,
                  box(
                    title = "Circuits Details",
                    solidHeader = TRUE,
                    status = "primary",
                    width = 12,
                    collapsible = TRUE,
                    column(9, leafletOutput("Circuits Details"))
                  )
                )
              ))),
      ######
      #Page6
      ######
      tabItem(
        tabName = "page6",
        dataTableOutput("myTable"),
        h2(strong("Data Source")),
        fluidRow(column(
          12,
          h4(
            "Below are the data tables our team used in building this website.
                              The original data source is based on the website ",
            strong("Ergast Developer API"),
            "which provides historical record of motor racing data for non-commercial purposes.
                              You can access the source by visiting this",
            a("link.", href = "http://ergast.com/mrd/db/#csv ")
          )
        )),
        selectInput("Data",
                    "Select Data:",
                    "",
                    multiple = FALSE)
      )
    )
  )
)

server <- function(input, output, session) {
  output$plot1 = renderPlot({
    
  })
  
  output$plot2 = renderPlotly({
    
  })
  
  output$myMap = renderLeaflet({
    
  })
  
  
}

#shiny
shinyApp(ui = ui, server = server)