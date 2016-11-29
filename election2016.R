source("loadPackages.R")

##########################
### Set-Up Twitter API ###
##########################
api_key = "cQuxuqfISjPdYlG9oyxq7WyBo"
api_secret = "bIR6mcc5x35SbLHJModcPPwKEVyiU3bRHD5UvIvbS6qRwkPPoi"
token_key = "1582629276-MNHj4zZxmgO6Fa63kiSnrXwuWKIWBpHo0NoXqKR"
token_secret = "Nbo4QKZeQpqyrr0WrtDhqnxoKMTz1XQkCgZZrQsE9uZX1"
setup_twitter_oauth(api_key, api_secret, token_key, token_secret)
rm(api_key, api_secret, token_key, token_secret)


###########################
### Organize Shapefiles ###
###########################
## Load state shapefiles
states <- readOGR(
  dsn = "shapefiles", 
  layer = "cb_2015_us_state_500k", 
  stringsAsFactors = FALSE, 
  verbose = FALSE
)

## Calculate state center points
center_pts <- gCentroid(states, byid = T)
states@data$lon <- center_pts@coords[, 1]
states@data$lat <- center_pts@coords[, 2]
rm(center_pts)

## Filter States (Minus non-Contintental US, Plus DC)
states.data <- states@data %>% filter(STUSPS %in% c(state.abb[-which(state.abb == "AK" | state.abb == "HI")], "DC"))


########################
### Mine Twitter API ###
########################



