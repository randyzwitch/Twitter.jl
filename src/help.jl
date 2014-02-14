#############################################################
#
# Help section Functions for Twitter API
#
#############################################################

#This doesn't currently support options
function get_help_configuration(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/help/configuration.json"
    
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

#This doesn't currently support options
function get_help_languages(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/help/languages.json"
    
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

#This doesn't currently support options
function get_help_privacy(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/help/privacy.json"
    
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

#This doesn't currently support options
function get_help_tos(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/help/tos.json"
    
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

#TODO: Add resources keyword argument
#https://dev.twitter.com/docs/api/1.1/get/application/rate_limit_status
function get_application_rate_limit_status(; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/application/rate_limit_status.json"
    
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
