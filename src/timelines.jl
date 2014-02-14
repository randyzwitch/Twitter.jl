#############################################################
#
# Timelines Functions
#
#############################################################

function mentions_timeline(count::Int; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/statuses/mentions_timeline.json"
    
    #Add status into options Dict
    options["count"] = "$count"

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

function get_user_timeline(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
    
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

function home_timeline(count::Int; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/statuses/home_timeline.json"
    
    #Add status into options Dict
    options["count"] = "$count"

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

function retweets_of_me(count::Int; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/statuses/retweets_of_me.json"
    
    #Add status into options Dict
    options["count"] = "$count"

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