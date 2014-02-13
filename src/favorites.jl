#############################################################
#
# Favorites Functions
#
#############################################################

#Get favorites list
#This doesn't currently support options
function get_favorites_list(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/favorites/list.json"
    
    #Add status into options Dict
    options["screen_name"] = screen_name

    #URI encode values for all keys
    for (k, v) in options
        options["$(k)"] = encodeURI(v)
    end
    
    #Build oauth_header
    oauth_header_val = oauth_header("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?screen_name=$(options["screen_name"])"); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

function post_favorites_destroy()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_favorites_create()
	#Requires user context
	error("Twitter API not fully implemented")
end
