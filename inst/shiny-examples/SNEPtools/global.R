# Shiny Global File

# Packages
library(shiny)
library(DT)
library(ggplot2)
library(readxl)
library(reshape2)
library(dplyr)
library(utils)
library(BioMonTools)
library(knitr)
library(maps)
library(rmarkdown)
library(markdown)
library(tidyr)
library(leaflet)
library(shinyjs) # used for download button enable
library(mapview) # used to download leaflet map
library(stringr)
library(shinythemes)
library(capture)


# Drop-down boxes
MMI <- "SNEP_2020_Bugs"


# File Size
# By default, the file size limit is 5MB. It can be changed by
# setting this option. Here we'll raise limit to 10MB.
options(shiny.maxRequestSize = 25*1024^2)


# define which metrics michigan wants to keep in indices

SNEPMetrics <- c("pi_OET"
                 ,"pt_ffg_pred"
                 ,"pt_NonIns"
                 ,"pt_POET"
                 ,"pt_tv_toler"
                 ,"pt_volt_semi")# END SNEPMetrics


#### GIS/Map data ####

dir_data <- file.path(".","GIS_Data")

## Central Hills / Western Highlands Regions
MA_region_shape <- rgdal::readOGR(file.path(dir_data, "BugClasses_20201001.shp"))

## Mass Major Basins

basins_shape <- rgdal::readOGR(file.path(dir_data,"MA_MajBasins.shp"))

## SNEP region

SNEP_region <- rgdal::readOGR(file.path(dir_data,"SNEP_Bound_20201001.shp"))

