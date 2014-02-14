#############################################################
#
# Saved Searches Functions
#
#############################################################

#Get saved searches
#This doesn't currently support options
function get_saved_searches_list(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/saved_searches/list.json"

    #URI encode values for all keys in Dict
    encodeURI(options)
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
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