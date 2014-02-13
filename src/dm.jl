#############################################################
#
# Direct Messages Functions
#
#############################################################

#Get Direct Messages
#This doesn't currently support options
function get_direct_messages(count::Int; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/direct_messages.json"
    
    #Add status into options Dict
    options["count"] = "$count"

    #URI encode values for all keys
    for (k, v) in options
        options["$(k)"] = encodeURI(v)
    end
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?count=$(options["count"])"); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

#Get Direct Messages Sent
#This doesn't currently support options
function get_direct_messages_sent(count::Int; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/direct_messages/sent.json"
    
    #Add status into options Dict
    options["count"] = "$count"

    #URI encode values for all keys
    for (k, v) in options
        options["$(k)"] = encodeURI(v)
    end
    
    #Build oauth_header
    oauth_header_val = oauthheader("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?count=$(options["count"])"); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

function get_direct_messages_show()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_direct_messages_destroy()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_direct_messages_send()
	#Requires user context
	error("Twitter API not fully implemented")
end