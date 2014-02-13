#############################################################
#
# Suggested Users Functions
#
#############################################################

#Get user_suggestions_slug
#This doesn't currently support options
function get_user_suggestions_slug(slug::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/users/suggestions/$(slug).json"
    
    #Add status into options Dict
    #options["slug"] = slug

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

#Get user_suggestions
#This doesn't currently support options
function get_user_suggestions(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/users/suggestions.json"
    
    #Add status into options Dict
    #options["slug"] = slug

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

#Get user suggestions slug members
#This doesn't currently support options
function get_users_suggestions_slug_members(slug::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/users/suggestions/$(slug)/members.json"
    
    #Add status into options Dict
    #options["slug"] = slug

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