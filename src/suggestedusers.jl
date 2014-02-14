#############################################################
#
# Suggested Users Functions
#
#############################################################

#Get user_suggestions_slug
#This doesn't currently support options
function get_user_suggestions_slug(slug::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/users/suggestions/$(slug).json"

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

#Get user_suggestions
#This doesn't currently support options
function get_user_suggestions(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/users/suggestions.json"

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

#Get user suggestions slug members
#This doesn't currently support options
function get_user_suggestions_slug_members(slug::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/users/suggestions/$(slug)/members.json"

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