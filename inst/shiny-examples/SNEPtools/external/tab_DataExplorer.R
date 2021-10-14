function(){
  tabPanel("Data Explorer"
           , titlePanel("Data Explorer - Explore Your Results!")
           , p("The map and plot below will be generated once metric values and scores have been calculated.")
           , p("Sites are clustered when zoomed out for increased visibility - zoom in for added detail!")
           , sidebarLayout(
             sidebarPanel(
               helpText("Use the drop down menu to select a Sample ID.")
               ,selectInput("siteid.select", "Select Sample ID:"
                            , "")##selectInput~END
               , p("After choosing a Sample ID, the map will zoom to its location and the plot will display scoring.")
               , br()
               , plotOutput("DatExp_plot")
               , plotOutput("Index_plot")

             )##sidebarPanel.END
             , mainPanel(
               tags$style(type = "text/css", "#map {height: calc(100vh - 80px) !important;}")
               # https://github.com/dreamRs/capture
               ,capture::capture(selector = "body"
                                 , filename = "all-page.png"
                                 , icon("camera-retro")
                                 , "Take screenshot of entire page"
                                 , class = "btn-primary")
               , br()
               , br()
               ,capture::capture(selector = "#mymap"
                                 , filename = "mymap.png"
                                 , icon("camera-retro")
                                 , "Take screenshot of map only"
                                 , class = "btn-info")
               , br()
               , leafletOutput("mymap", height = "85vh")

             )##mainPanel.END
           )#sidebarLayout.End
  )## tabPanel~END
}##FUNCTION~END
