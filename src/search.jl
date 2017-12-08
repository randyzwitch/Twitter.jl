#############################################################
#
# Search Functions
#
#############################################################

function get_search_tweets(q::String; options=Dict{String, String}())

    #Add required parameter(s) to options dict
    options["q"] = q

    r = get_oauth("https://api.twitter.com/1.1/search/tweets.json", options)

    #This is a placeholder, contains cursor data/metadata returned for paging
    #Evaluate returning a custom type where one field parsed array of tweets, one field metadata
    #metadata = r["search_metadata"]

    return r.status == 200 ? JSON.parse(String(r.body)) : error("Twitter API returned $(r.status) status")

end
