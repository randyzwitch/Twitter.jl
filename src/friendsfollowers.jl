#############################################################
#
# Friends & Followers Functions
#
#############################################################

function get_friendships_no_retweets()
	error("Twitter API not fully implemented")
end

function get_friends_ids(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/friends/ids.json"
    
    #Add status into options Dict
    options["screen_name"] = screen_name

    #URI encode values for all keys in Dict
    encodeURI(options)

    #Build query string
    query_str = Requests.format_query_str(options)
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?$query_str");
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

function get_followers_ids(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/followers/ids.json"
    
    #Add status into options Dict
    options["screen_name"] = screen_name

    #URI encode values for all keys in Dict
    encodeURI(options)

    #Build query string
    query_str = Requests.format_query_str(options)
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?$query_str");  
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

function get_friendships_lookup()
	error("Twitter API not fully implemented")
end

function get_friendships_incoming()
	error("Twitter API not fully implemented")
end

function get_friendships_outgoing()
	error("Twitter API not fully implemented")
end

function post_friendships_create()
	error("Twitter API not fully implemented")
end

function post_friendships_destroy()
	error("Twitter API not fully implemented")
end

function post_friendships_update()
	error("Twitter API not fully implemented")
end

function get_friendships_show()
	error("Twitter API not fully implemented")
end

function get_friends_list(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/friends/list.json"
    
    #Add status into options Dict
    options["screen_name"] = screen_name

    #URI encode values for all keys in Dict
    encodeURI(options)

    #Build query string
    query_str = Requests.format_query_str(options)
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?$query_str");
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

function get_followers_list(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/followers/list.json"
    
    #Add status into options Dict
    options["screen_name"] = screen_name

    #URI encode values for all keys in Dict
    encodeURI(options)

    #Build query string
    query_str = Requests.format_query_str(options)
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?$query_str"); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end