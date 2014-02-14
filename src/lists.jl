#############################################################
#
# Lists Functions
#
#############################################################

#Get lists
#This doesn't currently support options
function get_lists(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/lists/list.json"
    
    #Add status into options Dict
    options["screen_name"] = screen_name

    #URI encode values for all keys in Dict
    encodeURI(options)
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?screen_name=$(options["screen_name"])"); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

function get_lists_statuses()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_lists_members_destroy()
	#Requires user context
	error("Twitter API not fully implemented")
end

#Get lists membership
#This doesn't currently support options
function get_lists_memberships(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/lists/memberships.json"
    
    #Add status into options Dict
    options["screen_name"] = screen_name

    #URI encode values for all keys in Dict
    encodeURI(options)
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?screen_name=$(options["screen_name"])"); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

function get_lists_subscribers()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_lists_subscribers_create()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_lists_subscribers_show()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_lists_subscribers_destroy()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_lists_members_createall()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_lists_members_show()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_lists_members()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_lists_members_create()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_lists_destroy()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_lists_update()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_lists_create()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_lists_show()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_lists_subscriptions()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_lists_members_destroyall()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_lists_ownerships()
	#Requires user context
	error("Twitter API not fully implemented")
end