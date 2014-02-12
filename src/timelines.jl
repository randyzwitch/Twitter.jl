#############################################################
#
# Timelines Functions
#
#############################################################

#Mentions timeline
#This doesn't currently support options, need to dynamically build query parameter string
function mentions_timeline(count::Int; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/statuses/mentions_timeline.json"
    
    #Add status into options Dict
    options["count"] = "$count"

    #URI encode values for all keys
    for (k, v) in options
        options["$(k)"] = encodeURI(v)
    end
    
    #Build oauth_header
    oauth_header_val = oauth_header("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?count=$(options["count"])"); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

function get_user_timeline(screen_name::String; options = {})
    
    #Make GET call using helper function
    response = twgetappauth("https://api.twitter.com/1.1/statuses/user_timeline.json", 
                            "screen_name",
                            screen_name,
                            options)
    
    #Currently, just returns Response object from Requests.jl
	if response.status == 200
		return response
	else
        #This will return the summary 
		error(response)
	end
end

#Home timeline
#This doesn't currently support options
function home_timeline(count::Int; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/statuses/home_timeline.json"
    
    #Add status into options Dict
    options["count"] = "$count"

    #URI encode values for all keys
    for (k, v) in options
        options["$(k)"] = encodeURI(v)
    end
    
    #Build oauth_header
    oauth_header_val = oauth_header("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?count=$(options["count"])"); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end

#Retweets of me
#This doesn't currently support options
function retweets_of_me(count::Int; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/statuses/retweets_of_me.json"
    
    #Add status into options Dict
    options["count"] = "$count"

    #URI encode values for all keys
    for (k, v) in options
        options["$(k)"] = encodeURI(v)
    end
    
    #Build oauth_header
    oauth_header_val = oauth_header("GET", endpoint, options)
    
    return Requests.get(URI("$(endpoint)?count=$(options["count"])"); 
                    headers = {"Content-Type" => "application/x-www-form-urlencoded",
                    "Authorization" => oauth_header_val,
                    "Connection" => "close",
                    "Accept" => "*/*"})

end