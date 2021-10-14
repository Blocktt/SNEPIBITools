#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Source Pages ####

# Load files for individual screens

tab_Background <- source("external/tab_Background.R", local = TRUE)$value
tab_Instructions <- source("external/tab_Instructions.R", local = TRUE)$value
tab_Calculator <- source("external/tab_Calculator.R", local = TRUE)$value
tab_DataExplorer <- source("external/tab_DataExplorer.R", local = TRUE)$value
tab_StoryMaps <- source("external/tab_StoryMaps.R", local = TRUE)$value

# Themes
# Themes from bslib package
#https://rstudio.github.io/bslib/articles/bslib.html
#https://rstudio.github.io/bslib/articles/bs5-variables.html#form-check-radio-checked-bg-image
#https://bootswatch.com/minty/
# theme = bs_theme(bootswatch = "minty"
#                  ,primary = "#0b5394"
#                  ,secondary = "#79aa7b"
#                  ,"navbar-bg" = "#acccb4"
#                  ,"link-color" = "#fe9929"
#                  ,"progress-bar-bg" = "#0b5394"
#                  ,"pagination-active-bg" = "#79aa7b"
#                  ,"pagination-hover-bg" = "#b4d48c"
#                  ,"pagination-border-color" = "#b4d48c"
#                  ,"pagination-hover-border-color" = "#b4d48c"
#                  ,"pagination-active-border-color" = "#b4d48c"
#                  ,"pagination-bg" = "#b4d48c"
#                  ,"pagination-disabled-bg" = "#b4d48c")

# Define UI
shinyUI(navbarPage(theme = shinytheme("flatly")
                   ,"SNEP Stream IBI Calculator v0.1.3.900"
                   ,tab_Background()
                   ,tab_Instructions()
                   ,tab_Calculator()
                   ,tab_DataExplorer()
                   ,tab_StoryMaps()
          )## navbarPage~END
)## shinyUI~END
