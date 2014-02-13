#############################################################
#
# Help section Functions for Twitter API
#
#############################################################

#This doesn't currently support options
function get_help_configuration(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/help/configuration.json"
    
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

#This doesn't currently support options
function get_help_languages(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/help/languages.json"
    
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

#This doesn't currently support options
function get_help_privacy(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/help/privacy.json"
    
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

#This doesn't currently support options
function get_help_tos(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/help/tos.json"
    
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

#TODO: Add resources keyword argument
#https://dev.twitter.com/docs/api/1.1/get/application/rate_limit_status
function get_application_rate_limit_status(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/application/rate_limit_status.json"
    
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
