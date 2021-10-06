function(){
  navbarMenu("StoryMaps"
             ,tabPanel("Technical StoryMap"
                       , h3("An ArcGIS StoryMap that summarizes the technical work done to create the SNEP low-gradient IBI.")
                       , h3(tags$a(href= "https://storymaps.arcgis.com/stories/f8d9ce1ca4a24bcda99c1b780ae85179", "Direct Link"))
                       , htmlOutput("StoryMap_Tech")
             ) #tabPanel ~END
             ,tabPanel("Non-Technical StoryMap"
                       , h3("An ArcGIS StoryMap for non-technical audiences that explains biomonitoring and IBIs.")
                       , h3(tags$a(href= "https://storymaps.arcgis.com/stories/a70626f4c03e425ea9b3eecc5098f54b", "Direct Link"))
                       , htmlOutput("StoryMap_NonTech")
             ) #tabPanel ~END
  )## navbarMenu~End
}##FUNCTION~END
