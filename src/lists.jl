#############################################################
#
# Lists Functions
#
#############################################################

function get_lists(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/lists/list.json"
    
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

function get_lists_statuses()
	error("Twitter API not fully implemented")
end

function post_lists_members_destroy()
	error("Twitter API not fully implemented")
end

function get_lists_memberships(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/lists/memberships.json"
    
    #Add status into options Dict
    options["screen_name"] = screen_name

    #Build query string
    query_str = Requests.format_query_str(options)

    #URI encode values for all keys in Dict
    encodeURI(options)
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?$query_str");  
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

function get_lists_subscribers()
	error("Twitter API not fully implemented")
end

function post_lists_subscribers_create()
	error("Twitter API not fully implemented")
end

function get_lists_subscribers_show()
	error("Twitter API not fully implemented")
end

function post_lists_subscribers_destroy()
	error("Twitter API not fully implemented")
end

function post_lists_members_createall()
	error("Twitter API not fully implemented")
end

function post_lists_members_show()
	error("Twitter API not fully implemented")
end

function get_lists_members()
	error("Twitter API not fully implemented")
end

function post_lists_members_create()
	error("Twitter API not fully implemented")
end

function post_lists_destroy()
	error("Twitter API not fully implemented")
end

function post_lists_update()
	error("Twitter API not fully implemented")
end

function post_lists_create()
	error("Twitter API not fully implemented")
end

function get_lists_show()
	error("Twitter API not fully implemented")
end

function get_lists_subscriptions()
	error("Twitter API not fully implemented")
end

function post_lists_members_destroyall()
	error("Twitter API not fully implemented")
end

function get_lists_ownerships()
	error("Twitter API not fully implemented")
end