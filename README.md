# twitter-election-2016
Look at Twitter sentiment across the country following this controversial election.

## Twitter API
It's annoying.  Ideally, I would want to pull data from before and after the election.  Unfortunately, the `twitteR` package is pretty buggy.  As such, it tends to not like pulling old tweets beyond about a week or two.  I have yet to figure out if this is because of a limit to how far back the API allows you to call or maybe a package/tool specific issue.  Furthermore, it would've been nice to have more geocoded tweets.  I guess Twitter changed their policy to set the default to disable geo-tags.  Awesome for privacy, not so much for spatial analysis.  Still, I can at least filter based on region given a center point and x-mile radius.

## Load Packages Script
Seems like a lot of effort, but I basically wanted to develop logic that would allow people (my students, for example) to simply run the scripts and not worry about having the right packages installed on their system.  The logic simply checks if the package exists on the local machine, then either installs and loads it if its not there or simply load if it is.  The truth is I used this script as an excuse to procrastinate studying for a finance exam!

That said, it could probably become a function accepting a vector of character values which are the package names. Basically as it stands, you could just change the package names so it is potentially reproducible.  The value add means R scripts can be more deployable within enterprise.  R code dependence on local packages make the language difficult to adapt to at-scale deployments.  I guess creating a dynamic install/load packages construct in your scripts would make your code easier to share among colleagues and potentially even avoid translating your awesome models into Python or Java, for example, for product deployments.

## Election2016 Script
Note: This script runs the prior script.

There are some set up procedures here, primarily with setting up the API twitter keys and organizing the shapefiles.
