#####################
### Load Packages ###
#####################
## Call script
source("loadPackages.R")


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

## Define UTM Zone for each State
utm <- matrix(
  data = c(seq(-66, -126, -6),  # degree range
           seq(19, 9, -1)  # UTM Zones
           )
  , nrow = 11, ncol = 2  # 10 zones = 10 rows, 2 variables
  , byrow = FALSE  # Fill matrix column-wise
  , dimnames = list(NULL, c("lon_range", "zones"))  # Null row names, define col names
)
utm <- as.data.frame(utm)  # coerce matrix to df

## Assign UTM Zone for each State
states@data$zone <- NA
for (i in 0:nrow(states@data)-1) {
  if (states@data$lon_center[i] > min(utm[ ,1]) && states@data$lon_center[i] < max(utm[ ,1])) {
    for (j in 1:nrow(utm)) {
      if (states@data$lon_center[i] < utm$lon_range[j] && states@data$lon_center[i] > utm$lon_range[j+1]) {
        
      } else {
        next
      }
    }
  } else {
    next
  }
}

## Filter States (Minus non-Contintental US, Plus DC)
states_f <- fortify(states)
states@data$id <- as.character(0:(nrow(states@data)-1))
states.data <- left_join(states_f, states@data, by = c("id"= "id"))
states.data <- states@data %>% filter(STUSPS %in% 
                                      c(state.abb[-which(state.abb == "AK" | state.abb == "HI")], "DC"))  # state.abb is a R dataset


##########################
### Set-Up Twitter API ###
##########################
api_key = "INSERT HERE"
api_secret = "INSERT HERE"
token_key = "INSERT HERE"
token_secret = "INSERT HERE"
setup_twitter_oauth(api_key, api_secret, token_key, token_secret)
rm(api_key, api_secret, token_key, token_secret)


########################
### Mine Twitter API ###
########################



