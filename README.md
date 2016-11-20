# twitter-election-2016
Look at Twitter sentiment across the country following this controversial election.

## Twitter API
It's annoying.  Ideally, I would want to pull data from before and after the election.  Unfortunately, the twitteR package is pretty buggy.  As such, it tends to not like pulling historical.  I have yet to figure out if this is because of a limit to how far back the API allows you to call or maybe a package/tool specific issue.  Furthermore, it would've been nice to have more geocoded tweets.  I guess Twitter changed their policy to set the default to disable geo-tags.  Awesome for privacy, not so much for spatial analysis.  Still, I can at least filter based on region given a center point and x-mile radius.
