#############################################################
#
# Search Functions
#
#############################################################

function get_search_tweets(q::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/search/tweets.json"
    
    #Add status into options Dict
    options["q"] = q

    #URI encode values for all keys in Dict
    encodeURI(options)

    #Build query string
    query_str = Requests.format_query_str(options)
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    r = Requests.get(URI("$(endpoint)?$query_str");  
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end