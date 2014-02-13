#############################################################
#
# Users Functions
#
#############################################################

#Get Account Settings
#This doesn't currently support options
function get_account_settings(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/account/settings.json"
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI(endpoint); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

#Validate user credentials
#This doesn't currently support options
function validate_credentials(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/account/verify_credentials.json"
    
    #Add status into options Dict
    #options["screen_name"] = screen_name

    #URI encode values for all keys
    #for (k, v) in options
    #    options["$(k)"] = encodeURI(v)
    #end
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI(endpoint); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

function post_account_settings()
	#Requires user context
	error("Twitter API not fully implemented")
end

function update_delivery_device()
	#Requires user context
	error("Twitter API not fully implemented")
end

function update_profile()
	#Requires user context
	error("Twitter API not fully implemented")
end

function update_profile_background()
	#Requires user context
	error("Twitter API not fully implemented")
end

function update_profile_colors()
	#Requires user context
	error("Twitter API not fully implemented")
end

function update_profile_image()
	#Requires user context
	error("Twitter API not fully implemented")
end

#Get Blocks List
#This doesn't currently support options
function get_blocks_list(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/blocks/list.json"
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI(endpoint); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

#Get Blocked IDs
#This doesn't currently support options
function get_blocks_ids(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/blocks/ids.json"
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI(endpoint); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

function post_blocks_create()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_blocks_destroy()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_users_lookup()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_users_show()
	#Requires user context
	error("Twitter API not fully implemented")
end

#Get users search
#This doesn't currently support options
function get_users_search(q::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/users/search.json"
    
    #Add status into options Dict
    options["q"] = q

    #URI encode values for all keys
    for (k, v) in options
        options["$(k)"] = encodeURI(v)
    end
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
        return Requests.get(URI("$(endpoint)?q=$(options["q"])"); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

#Get users contributees
#This doesn't currently support options
function get_users_contributees(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/users/contributees.json"
    
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

#Get users contributors
#This doesn't currently support options
function get_users_contributors(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/users/contributors.json"
    
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

function post_account_remove_profile_banner()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_account_update_profile_banner()
	#Requires user context
	error("Twitter API not fully implemented")
end

#Get profile banner
#This doesn't currently support options
function get_profile_banner(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/users/profile_banner.json"
    
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
