#############################################################
#
# Friends & Followers Functions
#
#############################################################

function get_friendships_no_retweets()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_friends_ids(screen_name::String; options = {})
    
    #Make GET call using helper function
    response = twgetappauth("https://api.twitter.com/1.1/friends/ids.json", 
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

function get_followers_ids(screen_name::String; options = {})
    
    #Make GET call using helper function
    response = twgetappauth("https://api.twitter.com/1.1/followers/ids.json", 
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

function get_friendships_lookup()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_friendships_incoming()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_friendships_outgoing()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_friendships_create()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_friendships_destroy()
	#Requires user context
	error("Twitter API not fully implemented")
end

function post_friendships_update()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_friendships_show()
	#Requires user context
	error("Twitter API not fully implemented")
end

function get_friends_list(screen_name::String; options = {})
    
    #Make GET call using helper function
    response = twgetappauth("https://api.twitter.com/1.1/friends/list.json", 
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

function get_followers_list(screen_name::String; options = {})
    
    #Make GET call using helper function
    response = twgetappauth("https://api.twitter.com/1.1/followers/list.json", 
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