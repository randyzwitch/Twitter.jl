#############################################################
#
# Direct Messages Functions
#
#############################################################

#Get Direct Messages
function get_direct_messages(count::Int; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/direct_messages.json"
    
    #Add status into options Dict
    options["count"] = "$count"

    #URI encode values for all keys in Dict
    encodeURI(options)

    #Build query string
    query_str = Requests.format_query_str(options)
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?$query_str"); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

#Get Direct Messages Sent
function get_direct_messages_sent(count::Int; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/direct_messages/sent.json"
    
    #Add status into options Dict
    options["count"] = "$count"

    #URI encode values for all keys in Dict
    encodeURI(options)

    #Build query string
    query_str = Requests.format_query_str(options)
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?$query_str");  
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

function get_direct_messages_show()
	error("Twitter API not fully implemented")
end

function post_direct_messages_destroy()
	error("Twitter API not fully implemented")
end

function post_direct_messages_send()
	error("Twitter API not fully implemented")
end