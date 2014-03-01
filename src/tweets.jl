#############################################################
#
# Tweets Functions
#
#############################################################

function get_retweets_id(id::String; options = Dict())
	
    r = get_oauth("https://api.twitter.com/1.1/statuses/retweets/$(id).json", options)

    #Return array of type TWEETS
    return to_TWEETS(r)

end

function get_single_tweet_id(id::String; options = Dict())
	
    #Add required parameter(s) to options dict
    options["id"] = id

    r = get_oauth("https://api.twitter.com/1.1/statuses/show.json", options)

    #Return array of type TWEETS
    return to_TWEETS(r)

end

function post_destroy_single_tweet_id(id::String; options = Dict())
	
    r = post_oauth("https://api.twitter.com/1.1/statuses/destroy/$(id).json", options)

    #Return array of type TWEETS
    return to_TWEETS(r)

end

function post_status_update(status::String; options = Dict())
    
    #Add status into options Dict
    options["status"] = status

    r = post_oauth("https://api.twitter.com/1.1/statuses/update.json", options)

    #Return array of type TWEETS
    return to_TWEETS(r)
    
end

function post_status_retweet_id(id::String; options = Dict())

    r = post_oauth("https://api.twitter.com/1.1/statuses/retweet/$(id).json", options)

    #Return array of type TWEETS
    return to_TWEETS(r)

end

function post_status_update_media()
	error("Twitter API not fully implemented")
end

function get_oembed(; options = Dict())

    #Returns HTML code for embedding, leave as Dict instead of custom type
    r = get_oauth("https://api.twitter.com/1.1/statuses/oembed.json", options)
    
end

function get_retweeters_id(id::String; options = Dict())
    
    #Add required parameter(s) to options dict
    options["id"] = id

    #Return a Dict for now, only useful data value is array of ids
	r = get_oauth("https://api.twitter.com/1.1/statuses/retweeters/ids.json", options)

end