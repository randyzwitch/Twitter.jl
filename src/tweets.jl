#############################################################
#
# Tweets Functions
#
#############################################################

function get_retweets()
	error("Twitter API not fully implemented")
end

function get_single_tweet()
	error("Twitter API not fully implemented")
end

function destroy_single_tweet()
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

function get_retweet()
	error("Twitter API not fully implemented")
end

function post_status_update_media()
	error("Twitter API not fully implemented")
end

function get_oembed()
	error("Twitter API not fully implemented")
end

function get_retweeters()
	error("Twitter API not fully implemented")
end