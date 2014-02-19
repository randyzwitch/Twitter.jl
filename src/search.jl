#############################################################
#
# Search Functions
#
#############################################################

function get_search_tweets(q::String; options = Dict())
    
    #Add required parameter(s) to options dict
    options["q"] = q

    r = get_oauth("https://api.twitter.com/1.1/search/tweets.json", options)

end

