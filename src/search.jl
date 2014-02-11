#############################################################
#
# Search Functions
#
#############################################################

function search_tweets(q::String; options = {})
    
    #Make GET call using helper function
    response = twgetappauth("https://api.twitter.com/1.1/search/tweets.json", 
                            "q",
                            q,
                            options)
    
    #Currently, just returns Response object from Requests.jl
	if response.status == 200
		return response
	else
        #This will return the summary 
		error(response)
	end
end