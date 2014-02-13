#############################################################
#
# Saved Searches Functions
#
#############################################################

#Get saved searches
#This doesn't currently support options
function get_saved_searches_list(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/saved_searches/list.json"
    
    #Add status into options Dict
    #options["screen_name"] = screen_name

    #URI encode values for all keys
    for (k, v) in options
        options["$(k)"] = encodeURI(v)
    end
    
    #Build oauth_header
    oauth_header_val = oauth_header("GET", endpoint, options)
    
    return Requests.get(URI(endpoint); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

function get_saved_searches_id()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_saved_searches_create()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_saved_searches_destroy_id()
	#Requires user context
	error("Twitter API not fully implemented")
end