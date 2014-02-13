#############################################################
#
# Search Functions
#
#############################################################

#This doesn't currently support options
function search_tweets(q::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/search/tweets.json"
    
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