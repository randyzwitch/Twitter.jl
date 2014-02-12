#############################################################
#
# Tweets Functions
#
#############################################################

function get_retweets()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_single_tweet()
	#Requires user context
	error("Twitter API not fully implemented")
end

function destroy_single_tweet()
	#Requires user context
	error("Twitter API not fully implemented")
end

#Need to make this more generalized using options keyword argument
#Currently, function doesn't actually accept options, just status
function post_status_update(status::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/statuses/update.json"
    
    #Add status into options Dict
    options["status"] = status

    #URI encode values for all keys
    for (k, v) in options
        options["$(k)"] = encodeURI(v)
    end
    
    #Build oauth_header
    oauth_header_val = oauth_header("POST", endpoint, options)
    
    return Requests.post(URI(endpoint), 
                    "status=$(options["status"])", 
                    {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})
    
end

function get_retweet()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_status_update_media()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_oembed()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_retweeters()
	#Requires user context
	error("Twitter API not fully implemented")
end