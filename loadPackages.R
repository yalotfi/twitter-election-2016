rm(list = ls())

#####################
### Load Packages ###
#####################
## Check updated version of text mining/sentiment analysis package
if (!require("devtools"))
  install.packages("devtools")
devtools::install_github("mannau/tm.plugin.sentiment")

## List Required Packages
pkgs <- c(
  # Data and Plotting Packages
  "dplyr"
  , "gridExtra"
  , "ggplot2"
  
  # Text Mining Packages
  , "tm.plugin.sentiment"
  , "tm"
  
  # Twitter API
  , "twitteR"
  , "base64enc"
  
  # GIS Packages
  , "rgdal"
  , "rgeos"
  , "ggmap"
  , "raster"
  , "maptools"
)

## Load Them
for (i in 1:length(pkgs)) {
  
  # if package does not exist, install and load else just load
  if (pkgs[i] %in% rownames(installed.packages()) == FALSE) {
    install.packages(pkgs[i], dependencies = TRUE)
    library(pkgs[i], character.only = TRUE)
  } else {
    library(pkgs[i], character.only = TRUE)
  }
  
  # confirm packages loaded in current session
  print(pkgs[i] %in% loadedNamespaces())
}

## Make Sure All Loaded
if (sum(pkgs %in% loadedNamespaces()) != length(pkgs)) {
  print("Error Loading:")
  pkgs[! pkgs %in% loadedNamespaces()]
} else {
  print("All Loaded")
}
rm(pkgs, i)
