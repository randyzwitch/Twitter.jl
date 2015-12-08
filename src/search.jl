#############################################################
#
# Search Functions
#
#############################################################

function get_search_tweets(q::AbstractString; options=Dict{AbstractString, AbstractString}())

    #Add required parameter(s) to options dict
    options["q"] = q

    r = get_oauth("https://api.twitter.com/1.1/search/tweets.json", options)

    #This is a placeholder, contains cursor data/metadata returned for paging
    #Evaluate returning a custom type where one field parsed array of tweets, one field metadata
    #metadata = r["search_metadata"]

    #return to_TWEETS(r["statuses"])

    r.status == 200 ?  to_TWEETS(Requests.json(r)["statuses"]) : r

end

