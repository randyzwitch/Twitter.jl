#############################################################
#
# Tweets Functions
#
#############################################################

function get_retweets_id(id::AbstractString; options=Dict{AbstractString, AbstractString}())

    r = get_oauth("https://api.twitter.com/1.1/statuses/retweets/$(id).json", options)

    #Return array of type TWEETS
    #return to_TWEETS(r)
    return r.status == 200 ? to_TWEETS(Requests.json(r)) : r

end

function get_single_tweet_id(id::AbstractString; options=Dict{AbstractString, AbstractString}())

    #Add required parameter(s) to options dict
    options["id"] = id

    r = get_oauth("https://api.twitter.com/1.1/statuses/show.json", options)

    #Return array of type TWEETS
    #return to_TWEETS(r)
    return r.status == 200 ? to_TWEETS(Requests.json(r)) : r

end

function post_destroy_single_tweet_id(id::AbstractString; options=Dict{AbstractString, AbstractString}())

    r = post_oauth("https://api.twitter.com/1.1/statuses/destroy/$(id).json", options)

    #Return array of type TWEETS
    #return to_TWEETS(r)
    return r.status == 200 ? to_TWEETS(Requests.json(r)) : r

end

function post_status_update(status::AbstractString; options=Dict{AbstractString, AbstractString}())

    #Add status into options Dict
    options["status"] = status

    r = post_oauth("https://api.twitter.com/1.1/statuses/update.json", options)

    #Return array of type TWEETS
    #return to_TWEETS(r)
    return r.status == 200 ? to_TWEETS(Requests.json(r)) : r

end

function post_status_retweet_id(id::AbstractString; options=Dict{AbstractString, AbstractString}())

    r = post_oauth("https://api.twitter.com/1.1/statuses/retweet/$(id).json", options)

    #Return array of type TWEETS
    #return to_TWEETS(r)
    return r.status == 200 ? to_TWEETS(Requests.json(r)) : r

end

function post_status_update_media()
    error("Twitter API not fully implemented")
end

function get_retweeters_id(id::AbstractString; options=Dict{AbstractString, AbstractString}())

    #Add required parameter(s) to options dict
    options["id"] = id

    #Return a Dict for now, only useful data value is array of ids
    r = get_oauth("https://api.twitter.com/1.1/statuses/retweeters/ids.json", options)

    return r.status == 200 ? Requests.json(r) : r

end