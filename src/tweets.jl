#############################################################
#
# Tweets Functions
#
#############################################################

function get_retweets_id(id::String; options = Dict())
	
    r = get_oauth("https://api.twitter.com/1.1/statuses/retweets/$(id).json", options)

end

function get_single_tweet_id(; options = Dict())
	
    r = get_oauth("https://api.twitter.com/1.1/statuses/show.json", options)

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
    
    return Requests.post(URI(endpoint), 
                    "status=$(options["status"])", 
                    {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})
    
end

function post_status_retweet_id()
	error("Twitter API not fully implemented")
end

function post_status_update_media()
	error("Twitter API not fully implemented")
end

function get_oembed(; options = Dict())
	
    r = get_oauth("https://api.twitter.com/1.1/statuses/oembed.json", options)
    
end

function get_retweeters_id(; options = Dict())

	r = get_oauth("https://api.twitter.com/1.1/statuses/retweeters/ids.json", options)
end