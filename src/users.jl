#############################################################
#
# Users Functions
#
#############################################################

function get_account_settings(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/account/settings.json"

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

function validate_credentials(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/account/verify_credentials.json"

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

function post_account_settings()
	error("Twitter API not fully implemented")
end

function update_delivery_device()
	error("Twitter API not fully implemented")
end

function update_profile()
	error("Twitter API not fully implemented")
end

function update_profile_background()
	error("Twitter API not fully implemented")
end

function update_profile_colors()
	error("Twitter API not fully implemented")
end

function update_profile_image()
	error("Twitter API not fully implemented")
end

function get_blocks_list(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/blocks/list.json"

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

function get_blocks_ids(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/blocks/ids.json"

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

function post_blocks_create()
	error("Twitter API not fully implemented")
end

function post_blocks_destroy()
	error("Twitter API not fully implemented")
end

function get_users_lookup()
	error("Twitter API not fully implemented")
end

function get_users_show()
	error("Twitter API not fully implemented")
end

function get_users_search(q::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/users/search.json"
    
    #Add status into options Dict
    options["q"] = q

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

function get_users_contributees(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/users/contributees.json"
    
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

function get_users_contributors(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/users/contributors.json"
    
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

function post_account_remove_profile_banner()
	error("Twitter API not fully implemented")
end

function post_account_update_profile_banner()
	error("Twitter API not fully implemented")
end

function get_profile_banner(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/users/profile_banner.json"
    
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
