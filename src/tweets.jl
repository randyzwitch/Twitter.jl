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

function post_destroy_single_tweet_id()
	error("Twitter API not fully implemented")
end

#Need to make this more generalized using options keyword argument
#Currently, function doesn't actually accept options, just status
function post_status_update(status::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/statuses/update.json"
    
    #Add status into options Dict
    options["status"] = status

    #URI encode values for all keys in Dict
    encodeURI(options)
    
    #Build oauth_header
    oauth_header_val = oauthheader("POST", endpoint, options)
    
    r = Requests.post(URI(endpoint), 
                    "status=$(options["status"])", 
                    {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

    json = JSON.parse(r.data)

    #Return array of type TWEETS
    return to_TWEETS(json)
    
end

function post_status_retweet_id()
	error("Twitter API not fully implemented")
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