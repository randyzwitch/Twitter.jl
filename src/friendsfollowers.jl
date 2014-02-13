#############################################################
#
# Friends & Followers Functions
#
#############################################################

function get_friendships_no_retweets()
	#Requires user context
	error("Twitter API not fully implemented")
end

#This doesn't currently support options
function get_friends_ids(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/friends/ids.json"
    
    #Add status into options Dict
    options["screen_name"] = screen_name

    #URI encode values for all keys
    for (k, v) in options
        options["$(k)"] = encodeURI(v)
    end
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?screen_name=$(options["screen_name"])"); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

#This doesn't currently support options
function get_followers_ids(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/followers/ids.json"
    
    #Add status into options Dict
    options["screen_name"] = screen_name

    #URI encode values for all keys
    for (k, v) in options
        options["$(k)"] = encodeURI(v)
    end
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?screen_name=$(options["screen_name"])"); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

function get_friendships_lookup()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_friendships_incoming()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_friendships_outgoing()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_friendships_create()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_friendships_destroy()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_friendships_update()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_friendships_show()
	#Requires user context
	error("Twitter API not fully implemented")
end

#This doesn't currently support options
function get_friends_list(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/friends/list.json"
    
    #Add status into options Dict
    options["screen_name"] = screen_name

    #URI encode values for all keys
    for (k, v) in options
        options["$(k)"] = encodeURI(v)
    end
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?screen_name=$(options["screen_name"])"); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

#This doesn't currently support options
function get_followers_list(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/followers/list.json"
    
    #Add status into options Dict
    options["screen_name"] = screen_name

    #URI encode values for all keys
    for (k, v) in options
        options["$(k)"] = encodeURI(v)
    end
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?screen_name=$(options["screen_name"])"); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end