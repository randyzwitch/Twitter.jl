#############################################################
#
# Timelines Functions
#
#############################################################

function mentions_timeline()
	#Requires user context
	error("Twitter API not fully implemented")
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

function home_timeline()
	#Requires user context
	error("Twitter API not fully implemented")
end

function retweets_of_me()
	#Requires user context
	error("Twitter API not fully implemented")
end